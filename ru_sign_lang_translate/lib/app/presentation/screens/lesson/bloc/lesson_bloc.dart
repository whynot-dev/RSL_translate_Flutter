import 'dart:async';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';
import 'package:ru_sign_lang_translate/core/sessions/onnx_isolate_session.dart';
import 'package:ru_sign_lang_translate/core/utils/image_utils.dart';
import 'package:ru_sign_lang_translate/domain/entities/lesson_entity.dart';
import 'package:ru_sign_lang_translate/domain/enums/lesson_type.dart';
import 'package:video_player/video_player.dart';
import 'package:image/image.dart' as image_lib;

part 'lesson_state.dart';

part 'lesson_event.dart';

part 'lesson_bloc.freezed.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc({required LessonEntity lesson}) : super(LessonState(lesson: lesson)) {
    on<Init>(_init);
    on<BackClicked>(_backClicked);
    on<LessonTypeChanged>(_lessonTypeChanged);
    on<SwitchCameraClicked>(_switchCameraClicked);
    on<StartClicked>(_startClicked);
    on<StopClicked>(_stopClicked);
    on<GestureRecognized>(_gestureRecognized);
    add(LessonEvent.init());
  }

  SendPort? _sendPortIsolate;
  ReceivePort _receivePort = ReceivePort();
  late final List<CameraDescription> _cameras;
  FlutterIsolate? _isolate;
  StreamSubscription? _subscription;

  List<Uint8List> _inputQueue = [];
  Uint8List? _imageBytes;
  bool _isProcessing = false;

  FutureOr<void> _init(Init event, Emitter<LessonState> emit) async {
    final _cameraController = await _initCameraController();
    final _videoController = await _initVideoPlayerController();

    emit(state.copyWith(videoController: _videoController, cameraController: _cameraController));
  }

  FutureOr<void> _backClicked(BackClicked event, Emitter<LessonState> emit) async {
    if (state.cameraController != null && state.cameraController!.value.isStreamingImages) {
      await state.cameraController?.stopImageStream();
    }
    _sendPortIsolate?.send('close_session');
    _subscription?.cancel();
    _receivePort.close();
    _isolate?.kill();
    await state.cameraController?.dispose();
    await state.videoController?.dispose();

    emit(state.copyWith());
    emit(state.copyWith(action: NavigateBack()));
  }

  FutureOr<void> _lessonTypeChanged(LessonTypeChanged event, Emitter<LessonState> emit) {
    emit(state.copyWith(selectedLessonType: event.lessonType));
  }

  FutureOr<void> _switchCameraClicked(SwitchCameraClicked event, Emitter<LessonState> emit) async {
    if (state.cameraController?.description == _cameras[0]) {
      await state.cameraController?.setDescription(_cameras[1]);
      await _startCameraStream();
    } else if (state.cameraController?.description == _cameras[1]) {
      await state.cameraController?.setDescription(_cameras[0]);
      await _startCameraStream();
    }
  }

  FutureOr<void> _startClicked(StartClicked event, Emitter<LessonState> emit) async {
    await _startPortListener();
    _isolate = await FlutterIsolate.spawn(createOnnxIsolateSession, _receivePort.sendPort);
    await _startCameraStream();
    emit(state.copyWith(isStartingPractice: true, prediction: null));
  }

  FutureOr<void> _stopClicked(StopClicked event, Emitter<LessonState> emit) async {
    if (state.cameraController != null && state.cameraController!.value.isStreamingImages) {
      await state.cameraController?.stopImageStream();
    }
    _sendPortIsolate?.send('close_session');
    await _subscription?.cancel();
    _receivePort.close();
    _receivePort = ReceivePort();
    _isolate?.kill();
    emit(state.copyWith(isStartingPractice: false, prediction: null));
  }

  FutureOr<void> _gestureRecognized(GestureRecognized event, Emitter<LessonState> emit) async {
    if (state.cameraController != null && state.cameraController!.value.isStreamingImages) {
      await state.cameraController?.stopImageStream();
    }
    _sendPortIsolate?.send('close_session');
    _isolate?.kill();
    emit(state.copyWith(isStartingPractice: false, prediction: event.gesture));
  }

  FutureOr<void> _startPortListener() async {
    _subscription = _receivePort.listen((data) {
      print("Received message from isolate $data");
      if (data is SendPort) {
        _sendPortIsolate = data;
      }
      if (data is String) {
        String result = data;
        if (result.isNotEmpty) {
          print('--------result--------------$result-----------------------');
          _inputQueue.clear();
          _isProcessing = false;
          if (result == state.lesson.valueGesture) {
            add(LessonEvent.gestureRecognized(result));
          }
        } else {
          _inputQueue.clear();
          _isProcessing = false;
        }
      }
    });
  }

  FutureOr<void> _startCameraStream() async {
    if (state.cameraController != null && state.cameraController!.value.isStreamingImages) {
      await state.cameraController?.stopImageStream();
    }

    _inputQueue.clear();
    state.cameraController?.startImageStream((image) {
      if (_sendPortIsolate != null) {
        if (!_isProcessing) {
          image_lib.Image? decodedImage = ImageUtils.processCameraImage(image);

          image_lib.Image resizedImage = image_lib.copyResize(decodedImage!, width: 224, height: 224);

          _imageBytes = resizedImage.getBytes();

          if (_imageBytes != null) {
            if (_inputQueue.length >= 32) {
              _inputQueue.removeAt(0);
            }
            _inputQueue.add(_imageBytes!);
          }
          if (_inputQueue.length == 32) {
            _isProcessing = true;
            _sendPortIsolate?.send(_inputQueue);
          }
        }
      }
    });
  }

  Future<CameraController> _initCameraController() async {
    _cameras = await availableCameras();

    final _cameraController = CameraController(
      _cameras[0],
      ResolutionPreset.low,
    );

    await _cameraController.initialize().catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('!---- Error Camera Access Denied ---!');
            break;
          default:
            break;
        }
      }
    });
    return _cameraController;
  }

  Future<VideoPlayerController?> _initVideoPlayerController() async {
    try {
      final _videoController = VideoPlayerController.networkUrl(Uri.parse(state.lesson.url));
      await _videoController.initialize();
      return _videoController;
    } catch (e) {
      print('!---- Error failed initialize videoController ---!');
    }

    return null;
  }
}

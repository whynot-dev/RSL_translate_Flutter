import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:image/image.dart' as image_lib;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';
import 'package:ru_sign_lang_translate/core/sessions/onnx_isolate_session.dart';
import 'package:ru_sign_lang_translate/core/utils/image_utils.dart';

part 'translator_state.dart';

part 'translator_event.dart';

part 'translator_bloc.freezed.dart';

class TranslatorBloc extends Bloc<TranslatorEvent, TranslatorState> {
  TranslatorBloc() : super(TranslatorState()) {
    on<Init>(_init);
    on<GestureRecognized>(_gestureRecognized);
    on<SwitchCameraClicked>(_switchCameraClicked);
    on<BackClicked>(_backClicked);
    on<ShowLastPredictionsClicked>(_showLastPredictionsClicked);
    on<StartProcessing>(_startProcessing);
    add(TranslatorEvent.init());
  }

  SendPort? _sendPortIsolate;
  StreamSubscription? _subscription;
  final ReceivePort _receivePort = ReceivePort();
  late final List<CameraDescription> _cameras;
  FlutterIsolate? _isolate;

  List<Uint8List> _inputQueue = [];
  Uint8List? _imageBytes;
  bool _isProcessing = false;

  FutureOr<void> _init(Init event, Emitter<TranslatorState> emit) async {
    emit(state.copyWith(needLoader: true));

    final _cameraController = await _initCameraController();

    emit(state.copyWith(cameraController: _cameraController));

    await _startPortListener();

    _isolate = await FlutterIsolate.spawn(createOnnxIsolateSession, _receivePort.sendPort);

    await _startCameraStream();
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
          if ((state.gestures.isNotEmpty && result != state.gestures.last && result != 'no') ||
              (state.gestures.isEmpty && result != 'no')) {
            add(TranslatorEvent.gestureRecognized(result));
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
            add(TranslatorEvent.startProcessing());
            _sendPortIsolate?.send(_inputQueue);
          }
        }
      }
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'Disposed CameraController':
            print('!---- Error Disposed CameraController ---!');
            break;
          default:
            break;
        }
      }
    });
  }

  FutureOr<void> _gestureRecognized(GestureRecognized event, Emitter<TranslatorState> emit) async {
    List<String> _gestures = List.from(state.gestures);
    if (state.gestures.length >= 5) {
      _gestures.removeAt(0);
    }
    _gestures.add(event.gesture);
    emit(state.copyWith(currentGesture: event.gesture, gestures: _gestures, needLoader: false));
  }

  FutureOr<void> _switchCameraClicked(SwitchCameraClicked event, Emitter<TranslatorState> emit) async {
    if (state.cameraController?.description == _cameras[0]) {
      await state.cameraController?.setDescription(_cameras[1]);
      await _startCameraStream();
    } else if (state.cameraController?.description == _cameras[1]) {
      await state.cameraController?.setDescription(_cameras[0]);
      await _startCameraStream();
    }
  }

  FutureOr<void> _backClicked(BackClicked event, Emitter<TranslatorState> emit) async {
    if (state.cameraController != null && state.cameraController!.value.isStreamingImages) {
      await state.cameraController?.stopImageStream();
    }
    _sendPortIsolate?.send('close_session');
    await _subscription?.cancel();
    _receivePort.close();
    _isolate?.kill();
    state.cameraController?.dispose();
    emit(state.copyWith(action: null, cameraController: null));
    emit(state.copyWith(action: NavigateBack()));
  }

  FutureOr<void> _showLastPredictionsClicked(ShowLastPredictionsClicked event, Emitter<TranslatorState> emit) async {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: ShowLastPredictionsBottomSheet()));
  }

  FutureOr<void> _startProcessing(StartProcessing event, Emitter<TranslatorState> emit) async {
    emit(state.copyWith(needLoader: true));
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
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    return _cameraController;
  }
}

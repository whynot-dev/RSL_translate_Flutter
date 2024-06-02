import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/services.dart';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:image/image.dart' as image_lib;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_type.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';
import 'package:ru_sign_lang_translate/core/utils/image_utils.dart';
import 'package:onnxruntime/onnxruntime.dart';
import 'package:ru_sign_lang_translate/core/utils/image_utils_isolate.dart';
import 'package:ru_sign_lang_translate/core/utils/label_loader.dart';

part 'translator_state.dart';

part 'translator_event.dart';

part 'translator_bloc.freezed.dart';

@pragma('vm:entry-point')
void createIsolateSession(SendPort sendPort) async {
  OrtEnv.instance.init();
  const int topk = 1;
  const double threshold = 0.5;
  final sessionOptions = OrtSessionOptions();
  final rawAssetFile = await rootBundle.load('assets/models/net.onnx');
  final bytes = rawAssetFile.buffer.asUint8List();
  final session = OrtSession.fromBuffer(bytes, sessionOptions);
  final runOptions = OrtRunOptions();
  final loader = LabelLoader();
  await loader.createLabels();
  late Map<int, String> _labels;
  if (loader.labels != null) {
    _labels = loader.labels!;
  }

  late OrtValueTensor inputOrt;

  ReceivePort receivePortIsolate = ReceivePort();

  receivePortIsolate.listen((message) {
    if (message is List<Uint8List>) {
      List<Uint8List> inputQueue = message;

      Float32List float32list = processInput(inputQueue);
      // receivePortIsolate.timeout(Duration(milliseconds: 200));

      inputOrt = OrtValueTensor.createTensorWithDataList(float32list, [1, 3, 32, 224, 224]);
      final inputs = {session.inputNames.first: inputOrt};

      final outputs = session.run(runOptions, inputs, session.outputNames);
      OrtValue? value = outputs.first;
      inputOrt.release();

      List<List<double>>? predictionValue = value!.value as List<List<double>>?;
      Float32List prediction = Float32List.fromList(predictionValue!.first);
      outputs.first?.release();
      List<double> softmaxPrediction = softmax(prediction);

      // Find the top-K predictions
      List<int> topkLabels = topkIndices(softmaxPrediction, topk);
      List<double> topkConfidence = topkLabels.map((idx) => softmaxPrediction[idx]).toList();

      // Get the corresponding labels for the top-K predictions
      List<String> resultLabels = topkLabels.map((idx) => _labels[idx]!).toList();

      print('${topkConfidence}:${resultLabels.first}');



      if ((topkConfidence.maxOrNull ?? 0) < threshold) {
        sendPort.send('');
      } else {
        sendPort.send(resultLabels.first);
        print('${resultLabels} + !!!!!!!!!');
      }
    } else if (message is String) {
      if(message == 'close_session'){
        runOptions.release();
        sessionOptions.release();
        session.release();
        OrtEnv.instance.release();
        print('----- Session closed ------');
      }else{
        print('----- message in isolate:$message ------');
      }
    } else {
      print('----- message in isolate:$message ------');
    }
  });
  sendPort.send(receivePortIsolate.sendPort);
  print('----- IsolateSession created ------');
}

class TranslatorBloc extends Bloc<TranslatorEvent, TranslatorState> {
  TranslatorBloc() : super(TranslatorState()) {
    on<Init>(_init);
    on<GestureRecognized>(_gestureRecognized);
    on<SwitchCameraClicked>(_switchCameraClicked);
    on<BackClicked>(_backClicked);
    add(TranslatorEvent.init());
  }

  SendPort? _sendPortIsolate;
  late final ReceivePort? _receivePort;
  late final List<CameraDescription> _cameras;
  late final FlutterIsolate _isolate;

  FutureOr<void> _init(Init event, Emitter<TranslatorState> emit) async {
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

    List<Uint8List> inputQueue = [];

    Uint8List? _imageBytes;

    emit(state.copyWith(cameraController: _cameraController));

    bool _isProcessing = false;

    _receivePort = ReceivePort();

    _receivePort?.listen((data) {
      print("Received message from isolate $data");
      if (data is SendPort) {
        _sendPortIsolate = data;
      }
      if (data is String) {
        String result = data;
        if (result.isNotEmpty) {
          print('--------result--------------$result-----------------------');
          inputQueue.clear();
          _isProcessing = false;
          if ((state.gestures.isNotEmpty && result != state.gestures.last) || state.gestures.isEmpty) {
            add(TranslatorEvent.gestureRecognized(result));
          }
        } else {
          inputQueue.clear();
          _isProcessing = false;
        }
      }
    });

    _isolate = await FlutterIsolate.spawn(createIsolateSession, _receivePort!.sendPort);
    //
    _cameraController.startImageStream((image) {
      if (_sendPortIsolate != null) {
        if (!_isProcessing) {
          image_lib.Image? decodedImage = ImageUtils.processCameraImage(image);

          image_lib.Image resizedImage = image_lib.copyResize(decodedImage!, width: 224, height: 224);

          _imageBytes = resizedImage.getBytes();

          //_imageBytes = image_lib.encodeJpg(resizedImage);

          if (_imageBytes != null) {
            if (inputQueue.length >= 32) {
              inputQueue.removeAt(0);
            }
            inputQueue.add(_imageBytes!);
          }
          if (inputQueue.length == 32) {
            _isProcessing = true;

            _sendPortIsolate?.send(inputQueue);

            // if (predict != null) {
            //   inputQueue.clear();
            // }
            //_cameraController.stopImageStream();
          }
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
    emit(state.copyWith(currentGesture: event.gesture, gestures: _gestures));
  }

  FutureOr<void> _switchCameraClicked(SwitchCameraClicked event, Emitter<TranslatorState> emit) async {
    if (state.cameraController?.description == _cameras[0]) {
      await state.cameraController?.setDescription(_cameras[1]);
    } else if (state.cameraController?.description == _cameras[1]) {
      await state.cameraController?.setDescription(_cameras[0]);
    }
  }

  FutureOr<void> _backClicked(BackClicked event, Emitter<TranslatorState> emit) async {
    await state.cameraController?.stopImageStream();
    _sendPortIsolate?.send('close_session');
    _receivePort?.close();
    _isolate.kill();
    state.cameraController?.dispose();
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: NavigateBack()));
  }

// FutureOr<void> _closeSession() {
//   _runOptions.release();
//   _sessionOptions.release();
//   _session.release();
//   OrtEnv.instance.release();
// }

// Future<String?> _predict(Map<String, OrtValueTensor> inputs) async {
//   //final outputs = await _session.runAsync(_runOptions, inputs);
//   final outputs = await _session.run(_runOptions, inputs);
//   OrtValue? value = outputs?.first;
//
//   List<List<double>>? predictionValue = value!.value as List<List<double>>?;
//   Float32List prediction = Float32List.fromList(predictionValue!.first);
//   // outputs?.first?.release();
//   List<double> softmaxPrediction = softmax(prediction);
//
//   // Find the top-K predictions
//   List<int> topkLabels = topkIndices(softmaxPrediction, topk);
//   List<double> topkConfidence = topkLabels.map((idx) => softmaxPrediction[idx]).toList();
//
//   // Get the corresponding labels for the top-K predictions
//   List<String> resultLabels = topkLabels.map((idx) => _labels[idx]!).toList();
//
//   print('${topkConfidence}:${resultLabels.first}');
//
//   if ((topkConfidence.maxOrNull ?? 0) < threshold) {
//     return null;
//   } else {
//     print('${resultLabels} + !!!!!!!!!');
//     return resultLabels.first;
//   }
// }
}

Float32List processInput(List<Uint8List> inputQueue) {
  // Размерности для многомерного списка
  const int dim1 = 32;
  const int dim2 = 224;
  const int dim3 = 224;
  const int dim4 = 3;

  int totalElements = 1 * 3 * 32 * 224 * 224;

  Float32List result = Float32List(totalElements);

  // Заполнение Float32List из inputQueue
  for (int i = 0; i < dim1; i++) {
    for (int j = 0; j < dim2; j++) {
      for (int k = 0; k < dim3; k++) {
        for (int l = 0; l < dim4; l++) {
          int flatIndex = j * dim3 * dim4 + k * dim4 + l;
          int outputIndex = (l * dim1 * dim2 * dim3) + (i * dim2 * dim3) + (j * dim3) + k;
          result[outputIndex] = inputQueue[i][flatIndex] / 255.0;
        }
      }
    }
  }

  return result;
}

List<double> softmax(Float32List logits) {
  final double maxLogit = logits.reduce((a, b) => a > b ? a : b);
  final List<double> exps = logits.map((logit) => (logit - maxLogit).exp()).toList();
  final double sumExps = exps.reduce((a, b) => a + b);
  return exps.map((e) => e / sumExps).toList();
}

List<int> topkIndices(List<double> probs, int k) {
  final List<int> indices = List.generate(probs.length, (index) => index);
  indices.sort((a, b) => probs[b].compareTo(probs[a]));
  return indices.take(k).toList();
}

extension on double {
  double exp() => math.exp(this);
}

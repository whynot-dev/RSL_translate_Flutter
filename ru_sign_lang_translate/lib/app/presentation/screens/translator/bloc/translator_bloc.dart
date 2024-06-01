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

      // runOptions.release();
      // sessionOptions.release();
      // session.release();
      // OrtEnv.instance.release();

      // return resultLabels.first;
      if ((topkConfidence.maxOrNull ?? 0) < threshold) {
        sendPort.send('');
        //return '';
      } else {
        sendPort.send(resultLabels.first);
        print('${resultLabels} + !!!!!!!!!');
        //return resultLabels.first;
      }
    } else {
      print('----- message in isolate:$message ------');
    }
  });
  sendPort.send(receivePortIsolate.sendPort);
  print('----- IsolateSession created ------');
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

class TranslatorBloc extends Bloc<TranslatorEvent, TranslatorState> {
  TranslatorBloc() : super(TranslatorState()) {
    on<Init>(_init);
    on<GestureRecognized>(_gestureRecognized);
    add(TranslatorEvent.init());
  }

  final _assetFileName = 'assets/models/net.onnx';

  final int topk = 1;
  final double threshold = 0.5;
  late OrtSessionOptions _sessionOptions;
  late OrtSession _session;
  late OrtRunOptions _runOptions;
  late Map<int, String> _labels;
  SendPort? _sendPortIsolate;

  FutureOr<void> _init(Init event, Emitter<TranslatorState> emit) async {
    List<Uint8List> inputQueue = [];

    List<CameraDescription> _cameras = await availableCameras();
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

    Uint8List? _imageBytes;

    //await _initSession();

    emit(state.copyWith(cameraController: _cameraController));

    bool _isProcessing = false;

    final port = ReceivePort();
    port.listen((data) {
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

    final isolate = await FlutterIsolate.spawn(createIsolateSession, port.sendPort);
    //

    _cameraController.startImageStream((image) {
      if (_sendPortIsolate != null) {
        if (!_isProcessing) {
          image_lib.Image? decodedImage = ImageUtils.processCameraImage(image);

          image_lib.Image resizedImage = image_lib.copyResize(decodedImage!, width: 224, height: 224);

          _imageBytes = resizedImage.getBytes();

          //_imageBytes = resizedImage.getBytes().map((e) => e / 255.0).toList();

          //add(TranslatorEvent.frameReceived(_imageBytes!));
          //_imageBytes = image_lib.encodeJpg(resizedImage);

          if (_imageBytes != null) {
            if (inputQueue.length >= 32) {
              inputQueue.removeAt(0);
            }
            inputQueue.add(_imageBytes!);
          }
          //await Future.delayed(Duration(milliseconds: 200));
          if (inputQueue.length == 32) {
            _isProcessing = true;

            //Float32List float32list = Float32List(lengthQueue);
            //String result = await flutterCompute(createIsolateSession, inputQueue);
            _sendPortIsolate?.send(inputQueue);
            // if (result.isNotEmpty) {
            //   print('--------result--------------$result-----------------------');
            //   inputQueue.clear();
            //   _isProcessing = false;
            // } else {
            //   inputQueue.clear();
            //   _isProcessing = false;
            // }
            //print(result);
            //await Future.delayed(Duration(milliseconds: 1000));
            //

            // final inputOrt = OrtValueTensor.createTensorWithDataList(flatList1, [1, 3, 32, 224, 224]);
            // final inputs = {_session.inputNames.first: inputOrt};
            //
            // String? predict = await _predict(inputs);
            // //inputQueue.removeAt(0);
            // if (predict != null) {
            //   inputQueue.clear();
            // }
            //_cameraController.stopImageStream();
          }
          // }
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

  FutureOr<void> _initSession() async {
    OrtEnv.instance.init();
    _sessionOptions = OrtSessionOptions();
    final rawAssetFile = await rootBundle.load(_assetFileName);
    final bytes = rawAssetFile.buffer.asUint8List();
    _session = OrtSession.fromBuffer(bytes, _sessionOptions);
    _runOptions = OrtRunOptions();
    final loader = LabelLoader();
    await loader.createLabels();
    if (loader.labels != null) {
      _labels = loader.labels!;
    }
  }

  FutureOr<void> _closeSession() {
    _runOptions.release();
    _sessionOptions.release();
    _session.release();
    OrtEnv.instance.release();
  }

  Future<String?> _predict(Map<String, OrtValueTensor> inputs) async {
    //final outputs = await _session.runAsync(_runOptions, inputs);
    final outputs = await _session.run(_runOptions, inputs);
    OrtValue? value = outputs?.first;

    List<List<double>>? predictionValue = value!.value as List<List<double>>?;
    Float32List prediction = Float32List.fromList(predictionValue!.first);
    // outputs?.first?.release();
    List<double> softmaxPrediction = softmax(prediction);

    // Find the top-K predictions
    List<int> topkLabels = topkIndices(softmaxPrediction, topk);
    List<double> topkConfidence = topkLabels.map((idx) => softmaxPrediction[idx]).toList();

    // Get the corresponding labels for the top-K predictions
    List<String> resultLabels = topkLabels.map((idx) => _labels[idx]!).toList();

    print('${topkConfidence}:${resultLabels.first}');

    if ((topkConfidence.maxOrNull ?? 0) < threshold) {
      return null;
    } else {
      print('${resultLabels} + !!!!!!!!!');
      return resultLabels.first;
    }
  }
}

extension on double {
  double exp() => math.exp(this);
}

class LabelLoader {
  final pathToClassList = 'assets/labels/RSL_class_list.txt';
  Map<int, String>? labels;

  LabelLoader();

  Future<void> createLabels() async {
    String text = await rootBundle.loadString(pathToClassList);
    List<String> lines = text.split('\n');

    labels = {
      for (var line in lines)
        if (line.isNotEmpty) ..._decodeLine(line)
    };
  }

  Map<int, String> _decodeLine(String line) {
    final parts = line.split('\t');
    final index = int.parse(parts[0]);
    final label = parts[1];
    return {index: label};
  }
}

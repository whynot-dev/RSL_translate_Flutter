import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:onnxruntime/onnxruntime.dart';
import 'package:ru_sign_lang_translate/core/utils/label_loader.dart';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'dart:math' as math;

@pragma('vm:entry-point')
void createOnnxIsolateSession(SendPort sendPort) async {
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
      if (message == 'close_session') {
        runOptions.release();
        sessionOptions.release();
        session.release();
        OrtEnv.instance.release();
        print('----- Session closed ------');
      } else {
        print('----- message in isolate:$message ------');
      }
    } else {
      print('----- message in isolate:$message ------');
    }
  });
  sendPort.send(receivePortIsolate.sendPort);
  print('----- IsolateSession created ------');
}

Float32List processInput(List<Uint8List> inputQueue) {
  // [32,224,224,3] => [1,3,32,224,224]

  // Размерности для многомерного списка
  const int dim1 = 32;
  const int dim2 = 224;
  const int dim3 = 224;
  const int dim4 = 3;

  int totalElements = 1 * 3 * 32 * 224 * 224;

  Float32List result = Float32List(totalElements);

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

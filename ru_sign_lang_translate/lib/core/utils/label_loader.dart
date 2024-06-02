import 'package:flutter/services.dart';

class LabelLoader {
  static const String _pathToClassList = 'assets/labels/class_list.txt';
  Map<int, String>? labels;

  LabelLoader();

  Future<void> createLabels() async {
    String text = await rootBundle.loadString(_pathToClassList);
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
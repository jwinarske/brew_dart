import 'dart:convert';
import 'dart:io';

/// Load a golden file as a string.
String loadGoldenText(String filename) {
  final file = File('test/parsers/golden/$filename');
  return file.readAsStringSync();
}

/// Load a golden JSON file and decode it.
dynamic loadGoldenJson(String filename) {
  return jsonDecode(loadGoldenText(filename));
}

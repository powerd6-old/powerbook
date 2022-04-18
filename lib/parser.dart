import 'dart:convert';

import 'package:file/file.dart';
import 'package:yaml/yaml.dart';

import 'models/book.dart';

class Parser {
  final FileSystem fileSystem;

  Parser({required this.fileSystem});

  Book parseBook(String filePath) {
    final fileContents = fileSystem.file(filePath).readAsStringSync();
    final loadedDefinition = loadYaml(fileContents);
    return Book.fromJson(jsonDecode(jsonEncode(loadedDefinition)));
  }
}

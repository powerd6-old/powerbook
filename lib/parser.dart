import 'dart:convert';

import 'package:file/file.dart';
import 'package:yaml/yaml.dart';

import 'models/book.dart';

class Parser {
  final FileSystem fileSystem;

  Parser({required this.fileSystem});

  Book parseBook(String bookFilePath) {
    final fileContents = fileSystem.file(bookFilePath).readAsStringSync();
    final loadedDefinition = loadYaml(fileContents);
    final parsedBook = Book.fromJson(jsonDecode(jsonEncode(loadedDefinition)));
    return parsedBook;
  }
}

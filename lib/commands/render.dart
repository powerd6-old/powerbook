import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:file/local.dart';
import 'package:powerbook/models/book.dart';
import 'package:powerbook/parser.dart';

class RenderCommand extends Command {
  @override
  final String name = "render";
  @override
  final String description = "Renders a powerd6 book";

  RenderCommand() {
    argParser.addOption("book", help: "The book to be rendered");
  }

  @override
  void run() {
    print("Rendering the book: " + argResults!["book"].toString());
    Book book = parser.parseBook(argResults!['book']);
    print(jsonEncode(book));
  }

  final Parser parser = Parser(fileSystem: LocalFileSystem());
}

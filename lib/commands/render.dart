import 'package:args/command_runner.dart';

class RenderCommand extends Command {
  @override
  final name = "render";
  @override
  final description = "Renders a powerd6 book";

  RenderCommand() {
    argParser.addOption("book", help: "The book to be rendered");
  }

  @override
  Future<String> run() {
    print("Rendering the book: " + argResults!["book"].toString());
    return Future.value("");
  }
}

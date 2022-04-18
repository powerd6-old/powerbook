import 'package:args/command_runner.dart';

class CombineCommand extends Command {
  @override
  final name = "combine";
  @override
  final description = "Combines two or more powerd6 books";

  CombineCommand() {
    argParser.addMultiOption("books", help: "The powerd6 books to combine");
    argParser.addOption("outputName",
        defaultsTo: "combinedBook", help: "The name of the combined book");
  }

  @override
  Future<String> run() {
    print("Combining the files: " + argResults!["books"].toString());
    print("Output will be named: " + argResults!["outputName"].toString());
    return Future.value("");
  }
}

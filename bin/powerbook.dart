import 'package:args/command_runner.dart';
import 'package:powerbook/commands.dart';

void main(List<String> arguments) {
  CommandRunner("powerbook", "Tooling to combine and render powerd6 books")
    ..addCommand(RenderCommand())
    ..addCommand(CombineCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;
      print("Error: " + error.toString());
    });
}

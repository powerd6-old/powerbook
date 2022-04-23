import 'package:dart_eval/dart_eval.dart';
import 'package:file/file.dart';
import 'package:powerbook/models/content/template_content.dart';
import 'package:powerbook/views.dart';

class TemplateContentView extends View<TemplateContent> {
  final FileSystem fileSystem;

  TemplateContentView(
      {required TemplateContent model, required this.fileSystem})
      : super(model: model);

  @override
  String renderHtml() {
    File templateFile = fileSystem.file(model.template);
    Parse parser = Parse();
    final scope = parser.parse(templateFile.readAsStringSync());
    // TODO: Make the template runnable: https://pub.dev/packages/dart_eval/example
    throw UnimplementedError();
  }
}

import 'package:file/local.dart';
import 'package:powerbook/models/content.dart';
import 'package:powerbook/views.dart';
import 'package:powerbook/views/content/markdown_content.dart';
import 'package:powerbook/views/content/template_content.dart';

export 'content/markdown_content.dart' show MarkdownContentView;
export 'content/template_content.dart' show TemplateContentView;

class ContentView<T> extends View<Content> {
  ContentView({required Content model}) : super(model: model);

  @override
  String renderHtml() {
    switch (model.type) {
      case 'markdown':
        return MarkdownContentView(model: model as MarkdownContent)
            .renderHtml();
      case 'template':
        return TemplateContentView(
                model: model as TemplateContent, fileSystem: LocalFileSystem())
            .renderHtml();
      default:
        throw UnimplementedError(
            "Content is not able to renderHtml for a content of type: " +
                model.type);
    }
  }
}

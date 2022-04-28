import 'package:markdown/markdown.dart';
import 'package:powerbook/src/models/content.dart';

/// A `Content` type that returns the rendered results from a markdown string
class MarkdownContent extends Content {
  final String markdown;

  MarkdownContent({required this.markdown});

  @override
  String toHtml() {
    return markdownToHtml(markdown);
  }
}

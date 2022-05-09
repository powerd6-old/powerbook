import 'package:powerbook/mixins.dart';
export 'content/markdown_content.dart'
    show MarkdownContent, IndexableMarkdownContent;

/// A generic class that represents a single piece of content
abstract class Content with Renderable {
  Content();
}

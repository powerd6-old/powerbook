import 'package:markdown/markdown.dart';
import 'package:powerbook/mixins.dart';
import 'package:powerbook/models.dart';

/// A `Content` type that returns the rendered results from a markdown string
class MarkdownContent extends Content {
  final String markdown;

  MarkdownContent({required this.markdown});
  final blockSyntaxes = [TableSyntax(), HeaderSyntaxWithHeading()];

  @override
  String toHtml() {
    return markdownToHtml(markdown, blockSyntaxes: blockSyntaxes)
        .replaceAll(RegExp(r"(\n+)"), "");
  }
}

class IndexableMarkdownContent extends MarkdownContent with Indexable {
  final List<Heading> headings = [];

  IndexableMarkdownContent({required String markdown})
      : super(markdown: markdown);

  @override
  String getId() {
    if (headings.isEmpty) {
      toHtml(); // Hack to force `CollectHeadersForIndexable` to run.
    }
    return headings.first.getId();
  }

  @override
  String getTitle() {
    if (headings.isEmpty) {
      toHtml(); // Hack to force `CollectHeadersForIndexable` to run.
    }
    return headings.first.getTitle();
  }

  @override
  List<Indexable> getChildren() {
    return headings.sublist(1);
  }

  @override
  String toHtml() {
    return markdownToHtml(markdown, blockSyntaxes: [
      CollectHeadersForIndexable(headings),
      ...super.blockSyntaxes
    ]).replaceAll(RegExp(r"(\n+)"), "");
  }
}

// Sourced from: markdown package /lib/src/block_parser.dart
final _headerPattern = RegExp(r'^ {0,3}(#{1,6})[ \x09\x0b\x0c](.*?)#*$');

class HeaderSyntaxWithHeading extends BlockSyntax {
  @override
  RegExp get pattern => _headerPattern;

  const HeaderSyntaxWithHeading();

  @override
  Node parse(BlockParser parser) {
    var match = pattern.firstMatch(parser.current)!;
    parser.advance();
    var level = match[1]!.length;
    var contents = match[2]!.trim();
    return Text(Heading(title: contents, headingLevel: level).toHtml());
  }
}

class CollectHeadersForIndexable extends HeaderSyntaxWithHeading {
  final List<Heading> headings;

  @override
  RegExp get pattern => _headerPattern;

  const CollectHeadersForIndexable(this.headings);

  @override
  Node parse(BlockParser parser) {
    var match = pattern.firstMatch(parser.current)!;
    parser.advance();
    var level = match[1]!.length;
    var contents = match[2]!.trim();
    var heading = Heading(title: contents, headingLevel: level);
    headings.add(heading);
    return Text(heading.toHtml());
  }
}

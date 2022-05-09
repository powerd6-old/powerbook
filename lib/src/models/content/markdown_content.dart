import 'package:markdown/markdown.dart';
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

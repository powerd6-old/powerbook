import 'package:markdown/markdown.dart';
import 'package:powerbook/src/models/headed_content.dart';
import 'package:powerbook/src/models/heading.dart';

/// Similar to a `MarkdownContent`, but with an additional `Heading`
class HeadedMarkdownContent extends HeadedContent {
  final String markdown;

  HeadedMarkdownContent({required this.markdown, required Heading heading})
      : super(heading: heading);

  @override
  String toHtml() {
    return """
      ${getHeading().toHtml()}
      ${markdownToHtml(markdown)}
""";
  }
}

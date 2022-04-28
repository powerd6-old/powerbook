import 'package:powerbook/mixins.dart';
import 'package:powerbook/src/models/content.dart';
import 'package:powerbook/src/models/heading.dart';
export 'headed_content/headed_markdown_content.dart' show HeadedMarkdownContent;

/// Similar to `Content`, but with a `Heading`
abstract class HeadedContent extends Content with Renderable, Headed {
  final Heading heading;
  HeadedContent({required this.heading});

  @override
  Heading getHeading() {
    return heading;
  }
}

import 'package:powerbook/mixins.dart';
import 'package:slugify/slugify.dart';

/// A heading with a title and optional subtitle.
///
/// `Heading` can leverage different `headingLevel`s to represent hierarchy.
class Heading with Renderable, Indexable {
  final String title;
  final String? subtitle;
  final int headingLevel;

  Heading({required this.title, this.subtitle, this.headingLevel = 1});

  @override
  bool operator ==(Object other) {
    return other is Heading &&
        title == other.title &&
        subtitle == other.subtitle &&
        headingLevel == other.headingLevel;
  }

  @override
  int get hashCode => title.hashCode + subtitle.hashCode;

  @override
  String toHtml() {
    return """
      <header>
        <h$headingLevel>$title</h$headingLevel>
        ${subtitle?.split('\n').map((e) => '<p>$e</p>').join('\n')}
      </header>
""";
  }

  @override
  String getId() {
    return slugify(title);
  }

  @override
  String getTitle() {
    return title;
  }
}

import 'package:powerbook/mixins.dart';
import 'package:powerbook/src/extensions/paragraph.dart';
import 'package:powerd6/models.dart';
import 'package:slugify/slugify.dart';

/// A heading with a title and optional subtitle.
///
/// `Heading` can leverage different `headingLevel`s to represent hierarchy.
class Heading with Renderable, Indexable {
  final String title;
  final Paragraph? subtitle;
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
    return '<header id="${getId()}">'
        '<h$headingLevel>$title</h$headingLevel>'
        '${subtitle != null ? subtitle!.toHtml() : ""}'
        '</header>';
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

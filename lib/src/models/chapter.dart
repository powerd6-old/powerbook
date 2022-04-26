import 'package:collection/collection.dart';
import 'package:powerbook/mixins.dart';
import 'package:powerbook/models.dart';
import 'package:slugify/slugify.dart';

/// A Chapter containing a `Heading` and a list of `Content`.
class Chapter with Renderable, Indexable {
  final Heading heading;
  final List<Content> contents;

  Chapter({
    required this.heading,
    required this.contents,
  });

  @override
  bool operator ==(Object other) {
    return other is Chapter &&
        heading == other.heading &&
        IterableEquality().equals(contents, other.contents);
  }

  Chapter operator +(Chapter other) {
    List<Content> mergedContents = contents;
    mergedContents.addAll(other.contents);
    return Chapter(heading: heading, contents: mergedContents);
  }

  @override
  int get hashCode => heading.hashCode + contents.hashCode;

  @override
  String toHtml() {
    return """
      <section id="${getId()}">
        ${heading.toHtml()}
        ${contents.map((e) => e.toHtml()).join('\n')}
      </section>
""";
  }

  @override
  List<Indexable> getChildren() {
    return contents;
  }

  @override
  String getId() {
    return slugify(heading.title);
  }

  @override
  String getTitle() {
    return heading.getTitle();
  }
}
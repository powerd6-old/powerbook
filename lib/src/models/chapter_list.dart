import 'package:collection/collection.dart';
import 'package:powerbook/mixins.dart';
import 'package:powerbook/models.dart';

/// A List of `Chapter` with a `Heading`
class ChapterList with Renderable, Indexable {
  final Heading heading;
  final List<Chapter> chapters;

  ChapterList({required this.heading, required this.chapters});

  @override
  bool operator ==(Object other) {
    return other is ChapterList &&
        heading == other.heading &&
        IterableEquality().equals(chapters, other.chapters);
  }

  /// Merges two list of Chapters.
  ///
  /// The merge will combine chapters with the same title, appending the contents from the second chapter into the first chapter.
  ///
  /// Chapters are returned in the following order:
  /// - First the chapters from `first`, with the merged contents from `second` if applicable.
  /// - Then the chapters from `second`.
  ChapterList operator +(ChapterList other) {
    List<Chapter> result = [];
    result.addAll(chapters.map((e) {
      if (other.chapters.any((element) => element.heading == e.heading)) {
        return e +
            other.chapters
                .firstWhere((element) => element.heading == e.heading);
      }
      return e;
    }));
    result.addAll(other.chapters.where(
        (element) => !result.map((e) => e.heading).contains(element.heading)));
    return ChapterList(heading: heading, chapters: result);
  }

  @override
  int get hashCode => heading.hashCode + chapters.hashCode;

  @override
  String getId() {
    return heading.getId();
  }

  @override
  List<Indexable> getChildren() {
    return chapters.whereType<Indexable>().toList();
  }

  @override
  String toHtml() {
    return '<section id="${getId()}">'
        '${heading.toHtml()}'
        '${chapters.map((e) => e.toHtml()).join()}'
        '</section>';
  }

  @override
  String getTitle() {
    return heading.getTitle();
  }
}

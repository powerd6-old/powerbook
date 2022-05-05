import 'package:collection/collection.dart';
import 'package:powerbook/mixins.dart';
import 'package:powerbook/models.dart';

/// A book with a `Heading`, a list of `Author`s, a `ChapterList` and an optional `ChapterList` for the appendices.
class Book with Renderable, Indexable {
  final Heading heading;
  final List<Author> authors;
  final ChapterList chapters;
  final ChapterList? appendices;

  Book(
      {required this.heading,
      required this.authors,
      required this.chapters,
      this.appendices});

  @override
  bool operator ==(Object other) {
    return other is Book &&
        heading == other.heading &&
        IterableEquality().equals(authors, other.authors) &&
        chapters == other.chapters &&
        appendices == other.appendices;
  }

  Book operator +(Book other) {
    List<Author> mergedAuthors = authors;
    mergedAuthors.addAll(other.authors);
    mergedAuthors = mergedAuthors.toSet().toList();

    return Book(
        heading: heading,
        authors: mergedAuthors,
        chapters: chapters + other.chapters,
        appendices: appendices! + other.appendices!);
  }

  @override
  int get hashCode =>
      heading.hashCode +
      authors.hashCode +
      chapters.hashCode +
      appendices.hashCode;

  @override
  String toHtml() {
    return '<main>'
        '${heading.toHtml()}'
        '<section id="authors">'
        '${Heading(title: "Authors").toHtml()}'
        '${authors.map((e) => e.toHtml()).join()}'
        '</section>'
        '${Index(elements: getChildren()).toHtml()}'
        '${chapters.toHtml()}'
        '${appendices?.toHtml()}'
        '</main>';
  }

  @override
  List<Indexable> getChildren() {
    if (appendices != null) {
      return List.of([chapters, appendices!]);
    } else {
      return [chapters];
    }
  }

  @override
  String getId() {
    return heading.getId();
  }

  @override
  String getTitle() {
    return heading.getTitle();
  }
}

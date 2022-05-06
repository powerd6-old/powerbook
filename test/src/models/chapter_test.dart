import 'package:collection/collection.dart';
import 'package:mocktail/mocktail.dart';
import 'package:powerbook/models.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  test(
      'chapters are considered the same if they have the same title and contents',
      () async {
    Heading sharedChapterHeadings = Heading(title: "Introduction");
    Chapter firstChapter =
        Chapter(heading: sharedChapterHeadings, contents: []);
    Chapter copyOfFirstChapter =
        Chapter(heading: sharedChapterHeadings, contents: []);

    Chapter secondChapter =
        Chapter(heading: Heading(title: "Prologue"), contents: []);

    expect(firstChapter, equals(copyOfFirstChapter));
    expect(firstChapter, isNot(equals(secondChapter)));
  });
  test('chapters can be merged', () async {
    Content firstContent = MockContent();
    Content secondContent = MockContent();
    Heading chapterHeadings = Heading(title: "Introduction");

    Chapter firstChapter =
        Chapter(heading: chapterHeadings, contents: [firstContent]);
    Chapter extensionForFirstChapter =
        Chapter(heading: chapterHeadings, contents: [secondContent]);

    Chapter mergedChapter = firstChapter + extensionForFirstChapter;

    expect(mergedChapter.heading, equals(firstChapter.heading));
    expect(
        IterableEquality()
            .equals(mergedChapter.contents, [firstContent, secondContent]),
        equals(true));
  });
  group('rendering', () {
    final heading = MockHeading();
    when(() => heading.toHtml()).thenReturn("<h1>Heading</h1>");
    when(() => heading.getId()).thenReturn("heading");
    when(() => heading.getTitle()).thenReturn("Heading");

    final content = MockContent();
    when(() => content.toHtml()).thenReturn("<p>content</p>");

    final indexableContent = MockIndexableContent();
    when(() => indexableContent.getId()).thenReturn("content-id");
    when(() => indexableContent.toHtml()).thenReturn("<p>content</p>");

    test('chapter without content can be rendered', () async {
      String actual = Chapter(heading: heading, contents: []).toHtml();
      String expected = '<article id="heading"><h1>Heading</h1></article>';

      expect(actual, equals(expected));
    });

    test('chapter with content can be rendered', () async {
      String actual = Chapter(heading: heading, contents: [content]).toHtml();
      String expected =
          '<article id="heading"><h1>Heading</h1><section><p>content</p></section></article>';

      expect(actual, equals(expected));
    });

    test('chapter with indexable content can be rendered', () async {
      String actual =
          Chapter(heading: heading, contents: [indexableContent]).toHtml();
      String expected =
          '<article id="heading"><h1>Heading</h1><section id="content-id"><p>content</p></section></article>';

      expect(actual, equals(expected));
    });
  });
}

import 'package:mocktail/mocktail.dart';
import 'package:powerbook/models.dart';
import 'package:test/test.dart';

void main() {
  test('chapter lists can be merged', () async {
    Heading sharedChapterHeadings = Heading(title: "Introduction");

    ChapterList firstChapterList =
        ChapterList(heading: Heading(title: "First Chapter"), chapters: [
      Chapter(heading: sharedChapterHeadings, contents: [MockContent()]),
      Chapter(heading: Heading(title: "Prologue"), contents: [MockContent()])
    ]);

    ChapterList secondChapterList =
        ChapterList(heading: Heading(title: "Second Chapter"), chapters: [
      Chapter(heading: sharedChapterHeadings, contents: [MockContent()])
    ]);

    ChapterList merged = firstChapterList + secondChapterList;

    expect(merged.chapters.length, equals(2));
    expect(
        merged.chapters
            .firstWhere((element) => element.heading.title == "Introduction")
            .contents
            .length,
        equals(2));
  });
  group('rendering', () {
    final heading = MockHeading();
    when(() => heading.toHtml()).thenReturn("<h1>Heading</h1>");
    when(() => heading.getId()).thenReturn("heading");

    final chapter = MockChapter();
    when(() => chapter.toHtml()).thenReturn("<p>Content</p>");

    test('chapter lists without chapters are rendered correctly', () {
      String actual = ChapterList(heading: heading, chapters: []).toHtml();
      String expected = '<section id="heading"><h1>Heading</h1></section>';

      expect(actual, equals(expected));
    });
    test('chapter lists are rendered correctly', () {
      String actual =
          ChapterList(heading: heading, chapters: [chapter]).toHtml();
      String expected =
          '<section id="heading"><h1>Heading</h1><p>Content</p></section>';

      expect(actual, equals(expected));
    });
  });
}

class MockContent extends Mock implements Content {}

class MockChapter extends Mock implements Chapter {}

class MockHeading extends Mock implements Heading {}

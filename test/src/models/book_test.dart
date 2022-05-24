import 'package:mocktail/mocktail.dart';
import 'package:powerbook/models.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  group('rendering', () {
    final heading = MockHeading();
    when(() => heading.toHtml()).thenReturn("<h1>Heading</h1>");
    when(() => heading.getId()).thenReturn("heading");

    final chapterList = MockChapterList();
    when(() => chapterList.toHtml())
        .thenReturn("<section>ChapterList</section>");
    when(() => chapterList.getId()).thenReturn('mock-id');
    when(() => chapterList.getTitle()).thenReturn('Mocked Chapter List');
    when(() => chapterList.getChildren()).thenReturn(List.empty());

    test('book without appendices can be rendered', () async {
      String actual =
          Book(heading: heading, authors: [], chapters: chapterList).toHtml();
      String expected =
          '<main><h1>Heading</h1><section id="authors"><header id="authors"><h1>Authors</h1></header></section><section id="index"><ul><li><a href="#mock-id" target="_self">Mocked Chapter List</a></li></ul></section><section>ChapterList</section>null</main>';

      expect(actual, equals(expected));
    });
    test('book with appendices can be rendered', () async {
      String actual = Book(
              heading: heading,
              authors: [],
              chapters: chapterList,
              appendices: chapterList)
          .toHtml();
      String expected =
          '<main><h1>Heading</h1><section id="authors"><header id="authors"><h1>Authors</h1></header></section><section id="index"><ul><li><a href="#mock-id" target="_self">Mocked Chapter List</a></li><li><a href="#mock-id" target="_self">Mocked Chapter List</a></li></ul></section><section>ChapterList</section><section>ChapterList</section></main>';

      expect(actual, equals(expected));
    });
  });
  test("when merging books, the original objects remain the same", () {
    Book first = Book(
        heading: Heading(title: "First book"),
        authors: [Author(name: "John", email: "john@email.com")],
        chapters: ChapterList(heading: Heading(title: "Chapters"), chapters: [
          Chapter(heading: Heading(title: "Chapter 1"), contents: [])
        ]));
    int firstHashcode = first.hashCode;

    Book second = Book(
        heading: Heading(title: "Second book"),
        authors: [Author(name: "Mary", email: "mary@email.com")],
        chapters: ChapterList(heading: Heading(title: "Chapters"), chapters: [
          Chapter(heading: Heading(title: "Chapter 1"), contents: []),
          Chapter(heading: Heading(title: "Chapter 2"), contents: [])
        ]));
    int secondHashcode = second.hashCode;

    expect(firstHashcode, isNot(equals(secondHashcode)));

    Book merged = first + second;
    expect(first.hashCode, equals(firstHashcode));
    expect(second.hashCode, equals(secondHashcode));
  });
}

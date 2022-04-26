import 'package:powerbook/models.dart';
import 'package:test/test.dart';

import '../../mocks/mock_content.dart';

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
}

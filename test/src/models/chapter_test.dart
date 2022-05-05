import 'package:collection/collection.dart';
import 'package:mocktail/mocktail.dart';
import 'package:powerbook/models.dart';
import 'package:test/test.dart';

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
}

class MockContent extends Mock implements Content {}

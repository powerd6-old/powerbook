import 'package:powerbook/models.dart';
import 'package:test/test.dart';

void main() {
  group('markdown content', () {
    group('rendering', () {
      test('markdown content with multiple lines are all inlined', () {
        String actual = MarkdownContent(markdown: """
# Test

This is a paragraph

- This
- is
- a
- list
""").toHtml();
        String expected =
            '<header id="test"><h1>Test</h1></header><p>This is a paragraph</p><ul><li>This</li><li>is</li><li>a</li><li>list</li></ul>';

        expect(actual, equals(expected));
      });
      test('markdown headers become headings', () {
        String actual = MarkdownContent(markdown: """
# Test 1
## Test 2
### Test 3
""").toHtml();
        String expected =
            '<header id="test-1"><h1>Test 1</h1></header><header id="test-2"><h2>Test 2</h2></header><header id="test-3"><h3>Test 3</h3></header>';

        expect(actual, equals(expected));
      });
    });
  });

  group('indexable markdown content', () {
    group('rendering', () {
      test('markdown content with multiple lines are all inlined', () {
        var indexableMarkdownContent = IndexableMarkdownContent(markdown: """
# Test

This is a paragraph

- This
- is
- a
- list
""");
        String actual = indexableMarkdownContent.toHtml();
        String expected =
            '<header id="test"><h1>Test</h1></header><p>This is a paragraph</p><ul><li>This</li><li>is</li><li>a</li><li>list</li></ul>';

        expect(actual, equals(expected));
        expect(indexableMarkdownContent.getChildren().length, equals(0));
      });
      test('markdown headers become headings', () {
        var indexableMarkdownContent = IndexableMarkdownContent(markdown: """
# Test 1
## Test 2
### Test 3
""");
        String actual = indexableMarkdownContent.toHtml();
        String expected =
            '<header id="test-1"><h1>Test 1</h1></header><header id="test-2"><h2>Test 2</h2></header><header id="test-3"><h3>Test 3</h3></header>';

        expect(indexableMarkdownContent.getTitle(), equals('Test 1'));
        expect(actual, equals(expected));
        expect(indexableMarkdownContent.getChildren().length, equals(1));
        expect(indexableMarkdownContent.getChildren()[0].getChildren().length,
            equals(1));
      });
      test(
          'markdown headers are indexed even when toHtml is not explicitly called',
          () {
        var indexableMarkdownContent = IndexableMarkdownContent(markdown: """
# Test 1
""");
        expect(indexableMarkdownContent.getTitle(), equals('Test 1'));
      });
      test(
          'markdown headers are indexed in the correct nesting even when levels are complex and sparse',
          () {
        var indexableMarkdownContent = IndexableMarkdownContent(markdown: """
# Test 1
## Test 2
#### Test 3
## Test 4
### Test 5
# Test 6
""");
        expect(indexableMarkdownContent.getTitle(), equals('Test 1'));
        expect(
            Index(elements: indexableMarkdownContent.getChildren()).toHtml(),
            equals(
                '<section id="index"><ul><li><a href="#test-2" target="_self">Test 2</a><ul><li><a href="#test-3" target="_self">Test 3</a></li></ul></li><li><a href="#test-4" target="_self">Test 4</a><ul><li><a href="#test-5" target="_self">Test 5</a></li></ul></li><li><a href="#test-6" target="_self">Test 6</a></li></ul></section>'));
      });
    });
  });
}

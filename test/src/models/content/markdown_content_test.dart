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

        expect(actual, equals(expected));
        expect(indexableMarkdownContent.getChildren().length, equals(2));
      });
    });
  });
}

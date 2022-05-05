import 'package:powerbook/models.dart';
import 'package:test/test.dart';

void main() {
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
          '<h1>Test</h1><p>This is a paragraph</p><ul><li>This</li><li>is</li><li>a</li><li>list</li></ul>';

      expect(actual, equals(expected));
    });
  });
}

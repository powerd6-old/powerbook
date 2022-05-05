import 'package:powerbook/models.dart';
import 'package:test/test.dart';

void main() {
  group('rendering', () {
    const link = "link";
    const text = "text";
    test('reference is rendered correctly', () async {
      String actual = Reference(text: text, link: link).toHtml();
      String expected = '<a href="link" target="_self">text</a>';

      expect(actual, equals(expected));
    });
    test('reference is rendered correctly when external', () async {
      String actual = Reference.external(text: text, link: link).toHtml();
      String expected = '<a href="link" target="_blank">text</a>';

      expect(actual, equals(expected));
    });
    test('reference is rendered correctly when internal', () async {
      String actual = Reference.internal(text: text, link: link).toHtml();
      String expected = '<a href="#link" target="_self">text</a>';

      expect(actual, equals(expected));
    });
  });
}

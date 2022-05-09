import 'package:powerbook/models.dart';
import 'package:powerd6/models.dart';
import 'package:test/test.dart';

void main() {
  test('reference can be created for an attribute', () async {
    Reference createdReference = Reference.forAttribute(Attributes.agility);

    String expected = '<a href="#attribute-agility" target="_self">Agility</a>';
    expect(createdReference.toHtml(), equals(expected));
  });
  test('reference can be created for a focus', () async {
    Reference createdReference = Reference.forFocus(Focuses.awareness);

    String expected =
        '<a href="#focus-awareness" target="_self">Awareness(Perception)</a>';
    expect(createdReference.toHtml(), equals(expected));
  });
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

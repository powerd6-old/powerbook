import 'package:powerbook/src/extensions/paragraph.dart';
import 'package:powerd6/models.dart';
import 'package:test/test.dart';

void main() {
  group('rendering', () {
    test('paragraph can render single lines', () async {
      String actual = Paragraph(["single line"]).toHtml();
      String expected = '<p>single line</p>';

      expect(actual, equals(expected));
    });
    test('paragraph can render multiple lines', () async {
      String actual = Paragraph(["first line", "second line"]).toHtml();
      String expected = '<p>first line</p><p>second line</p>';

      expect(actual, equals(expected));
    });
  });
}

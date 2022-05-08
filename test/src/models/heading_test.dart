import 'package:powerbook/models.dart';
import 'package:powerd6/models.dart';
import 'package:test/test.dart';

void main() {
  test('headings are the same if all of the content matches', () async {
    Heading heading1 = Heading(title: "First Title");
    Heading heading2 = Heading(title: "Second Title");
    Heading heading3 =
        Heading(title: "First Title", subtitle: Paragraph(["An Extension"]));
    Heading heading4 = Heading(title: "First Title", headingLevel: 2);

    expect(
        {heading1, heading2, heading3, heading4}.length,
        equals(
            4)); // None of the elements must equal any other in order for the Set to have all elements.
  });
  group('rendering', () {
    const title = "Title";
    const subtitle = Paragraph(["Subtitle"]);

    test('headings without subtitle are rendered correctly', () {
      String actual = Heading(title: title).toHtml();
      String expected = '<header id="title"><h1>Title</h1></header>';

      expect(actual, equals(expected));
    });
    test('headings with subtitle are rendered correctly', () {
      String actual = Heading(title: title, subtitle: subtitle).toHtml();
      String expected =
          '<header id="title"><h1>Title</h1><p>Subtitle</p></header>';

      expect(actual, equals(expected));
    });
    test('headings with custom heading levels are rendered correctly', () {
      String actual = Heading(title: title, headingLevel: 3).toHtml();
      String expected = '<header id="title"><h3>Title</h3></header>';

      expect(actual, equals(expected));
    });
  });
}

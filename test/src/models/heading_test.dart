import 'package:powerbook/models.dart';
import 'package:test/test.dart';

void main() {
  test('headings are the same if all of the content matches', () async {
    Heading heading1 = Heading(title: "First Title");
    Heading heading2 = Heading(title: "Second Title");
    Heading heading3 = Heading(title: "First Title", subtitle: "An Extension");
    Heading heading4 = Heading(title: "First Title", headingLevel: 2);

    expect(
        {heading1, heading2, heading3, heading4}.length,
        equals(
            4)); // None of the elements must equal any other in order for the Set to have all elements.
  });
}

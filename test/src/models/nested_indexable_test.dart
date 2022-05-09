import 'package:powerbook/models.dart';
import 'package:powerbook/src/models/nested_indexable.dart';
import 'package:test/test.dart';

void main() {
  test('nested indexable for a single element returns itself', () async {
    Heading mockHeading = Heading(title: "mock-id");

    NestedIndexable nestedIndexable = NestedIndexable.from([mockHeading]);

    expect(nestedIndexable.getId(), equals(mockHeading.getId()));
    expect(nestedIndexable.getChildren(), equals(List.empty()));
  });
  test(
      'nested indexable for multiple element returns the first as the parent and all nested children',
      () async {
    Heading firstHeading = Heading(title: "first-id");
    Heading secondHeading = Heading(title: "second-id", headingLevel: 2);

    NestedIndexable nestedIndexable =
        NestedIndexable.from([firstHeading, secondHeading]);

    expect(nestedIndexable.getId(), equals(firstHeading.getId()));
    expect(nestedIndexable.getChildren(), orderedEquals([secondHeading]));
  });
  test('nested indexable for multiple element returns itself', () async {
    Heading firstHeading = Heading(title: "first-id");
    Heading secondHeading = Heading(title: "second-id", headingLevel: 2);
    Heading thirdHeading = Heading(title: "third-id", headingLevel: 3);
    Heading fourthHeading = Heading(title: "fourth-id", headingLevel: 2);

    NestedIndexable nestedIndexable = NestedIndexable.from(
        [firstHeading, secondHeading, thirdHeading, fourthHeading]);

    expect(nestedIndexable.getId(), equals(firstHeading.getId()));
    expect(nestedIndexable.getChildren()[0].getId(),
        equals(secondHeading.getId()));
    expect(nestedIndexable.getChildren()[0].getChildren()[0],
        equals(thirdHeading));
    expect(nestedIndexable.getChildren()[1].getId(),
        equals(fourthHeading.getId()));
  });
}

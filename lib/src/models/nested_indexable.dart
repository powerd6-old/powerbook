import 'package:collection/collection.dart';
import 'package:powerbook/mixins.dart';
import 'package:powerbook/models.dart';

class NestedIndexable with Indexable {
  final Indexable self;
  final List<Indexable> children;

  @override
  bool operator ==(Object other) {
    return other is NestedIndexable &&
        self == other.self &&
        IterableEquality().equals(children, other.children);
  }

  @override
  int get hashCode => self.hashCode ^ children.hashCode;

  NestedIndexable({required this.self, required this.children});

  NestedIndexable.from(List<Heading> headings)
      : self = headings.first,
        children = buildChildrenListForNestedHeadings(headings);

  static List<Indexable> buildChildrenListForNestedHeadings(
      List<Heading> headings) {
    if (headings.length <= 1) {
      return [];
    } else {
      Heading firstHeading = headings.first;
      headings = headings.sublist(1);
      List<List<Heading>> children = headings
          .splitBeforeIndexed((index, element) =>
              element.headingLevel <= firstHeading.headingLevel + 1)
          .toList();
      return children.map(nestOrReturnElement).toList();
    }
  }

  static Indexable nestOrReturnElement(List<Heading> indexed) {
    if (indexed.length == 1) {
      return indexed.first;
    } else {
      return NestedIndexable.from(indexed);
    }
  }

  @override
  String getId() {
    return self.getId();
  }

  @override
  String getTitle() {
    return self.getTitle();
  }

  @override
  List<Indexable> getChildren() {
    return children;
  }
}

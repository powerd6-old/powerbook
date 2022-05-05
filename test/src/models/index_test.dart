import 'package:mocktail/mocktail.dart';
import 'package:powerbook/models.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  group('rendering', () {
    final indexable = MockIndexable();
    when(() => indexable.getId()).thenReturn('mock-id');
    when(() => indexable.getTitle()).thenReturn('Mocked Indexable');

    final childIndexable = MockIndexable();
    when(() => childIndexable.getId()).thenReturn('child-id');
    when(() => childIndexable.getTitle()).thenReturn('Child Indexable');
    when(() => childIndexable.getChildren()).thenReturn(List.empty());
    test('index with zero items', () async {
      String actual = Index(elements: []).toHtml();
      String expected = "";

      expect(actual, equals(expected));
    });

    test('index with a single item', () async {
      when(() => indexable.getChildren()).thenReturn(List.empty());

      String actual = Index(elements: [indexable]).toHtml();
      String expected =
          '<section id="index"><ul><li><a href="#mock-id" target="_self">Mocked Indexable</a></li></ul></section>';

      expect(actual, equals(expected));
    });

    test('index with an item with children', () async {
      when(() => indexable.getChildren()).thenReturn([childIndexable]);

      String actual = Index(elements: [indexable]).toHtml();
      String expected =
          '<section id="index"><ul><li><a href="#mock-id" target="_self">Mocked Indexable</a><ul><li><a href="#child-id" target="_self">Child Indexable</a></li></ul></li></ul></section>';

      expect(actual, equals(expected));
    });
  });
}

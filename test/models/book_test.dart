import 'dart:convert';

import 'package:powerbook/models/book.dart';
import 'package:test/test.dart';

void main() {
  group('deserialization', () {
    test('book without contents can be read from JSON', () async {
      String jsonChapter =
          '{"title": "The book of life","authors": [],"chapters": [],"appendices": []}';
      Book expected = Book(
          title: "The book of life", authors: [], chapters: [], appendices: []);

      Book deserialized = Book.fromJson(jsonDecode(jsonChapter));

      expect(deserialized, equals(expected));
    });
  });
  group('serialization', () {
    test('book without contents can be written to JSON', () async {
      Map<String, dynamic> expected = jsonDecode(
          '{"title": "The book of life","authors": [],"chapters": [],"appendices": []}');
      Book book = Book(
          title: "The book of life", authors: [], chapters: [], appendices: []);

      expect(book.toJson(), equals(expected));
    });
  });
}

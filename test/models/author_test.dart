import 'dart:convert';

import 'package:powerbook/models/author.dart';
import 'package:test/test.dart';

void main() {
  group('deserialization', () {
    test('an exception in thrown if the JSON is not valid', () async {
      String jsonAuthor = '{}';

      expect(() => Author.fromJson(jsonDecode(jsonAuthor)),
          throwsA(isA<TypeError>()));
    });
    test('author can be read from JSON', () async {
      String jsonAuthor = '{"name": "John Smith","email": "john@example.com"}';
      Author expected = Author(name: "John Smith", email: "john@example.com");

      Author deserialized = Author.fromJson(jsonDecode(jsonAuthor));

      expect(deserialized, equals(expected));
    });
    test('author can be read from JSON with twitter', () async {
      String jsonAuthor =
          '{"name": "John Smith","email": "john@example.com","twitter": "JohnSmith"}';
      Author expected = Author(
          name: "John Smith", email: "john@example.com", twitter: "JohnSmith");

      Author deserialized = Author.fromJson(jsonDecode(jsonAuthor));

      expect(deserialized, equals(expected));
      expect(deserialized.twitter, equals(expected.twitter));
    });
  });
  group('serialization', () {
    test('author can be written to JSON', () async {
      Map<String, dynamic> expected =
          jsonDecode('{"name": "John Smith","email": "john@example.com"}');
      Author author = Author(name: "John Smith", email: "john@example.com");

      expect(author.toJson(), equals(expected));
    });
    test('author can be written to JSON with twitter', () async {
      Map<String, dynamic> expected = jsonDecode(
          '{"name": "John Smith","email": "john@example.com","twitter": "JohnSmith"}');
      Author author = Author(
          name: "John Smith", email: "john@example.com", twitter: "JohnSmith");

      expect(author.toJson(), equals(expected));
    });
  });

  test('authors are considered the same if they have the same email', () async {
    Author firstAuthor = Author(name: "John Smith", email: "john@example.com");

    Author copyOfFirstAuthor =
        Author(name: "John Smith", email: "john@example.com");
    Author firstAuthorWithDifferentName =
        Author(name: "Johnny Smith", email: "john@example.com");

    Author secondAuthor = Author(name: "Mary Jane", email: "mary@example.com");

    expect(firstAuthor, equals(copyOfFirstAuthor));
    expect(firstAuthor, equals(firstAuthorWithDifferentName));
    expect(firstAuthor, isNot(equals(secondAuthor)));
  });
}

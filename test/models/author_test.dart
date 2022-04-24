import 'package:powerbook/models/author.dart';
import 'package:test/test.dart';

void main() {
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

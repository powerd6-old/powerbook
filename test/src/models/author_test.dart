import 'package:powerbook/src/models/author.dart';
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
    expect(firstAuthor.hashCode, equals(copyOfFirstAuthor.hashCode));
    expect(firstAuthor, equals(firstAuthorWithDifferentName));
    expect(firstAuthor, isNot(equals(secondAuthor)));
    expect(firstAuthor.hashCode, isNot(equals(secondAuthor.hashCode)));
  });

  group('rendering', () {
    const name = "John Smith";
    const email = "john@example.com";
    const twitter = "JohnSmith";
    test('author without twitter is rendered correctly', () {
      String actual = Author(name: name, email: email).toHtml();
      String expected =
          '<article id="author-johnatexamplecom"><h1>John Smith</h1><h2><a href="mailto:john@example.com" target="_blank">john@example.com</a></h2></article>';

      expect(actual, equals(expected));
    });
    test('author with a twitter is rendered correctly', () {
      String actual =
          Author(name: name, email: email, twitter: twitter).toHtml();
      String expected =
          '<article id="author-johnatexamplecom"><h1>John Smith</h1><h2><a href="mailto:john@example.com" target="_blank">john@example.com</a></h2><a href="https://twitter.com/JohnSmith" target="_blank">@JohnSmith</a></article>';

      expect(actual, equals(expected));
    });
  });
}

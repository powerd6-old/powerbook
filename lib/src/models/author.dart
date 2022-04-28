import 'package:powerbook/mixins.dart';
import 'package:powerbook/models.dart';
import 'package:slugify/slugify.dart';

/// An author, with email and optionally a twitter.
///
/// Authors are uniquely identified by their **email**.
class Author with Renderable {
  final String name;
  final String email;
  final String? twitter;

  Author({required this.name, required this.email, this.twitter});

  @override
  bool operator ==(Object other) {
    return other is Author && email == other.email;
  }

  @override
  int get hashCode => email.hashCode;

  @override
  String toHtml() {
    String twitterPartial = twitter != null
        ? Reference.external(
                text: "@$twitter", link: "https://twitter.com/$twitter")
            .toHtml()
        : "";
    return """
      <article id="author-${slugify(email)}">
        <h1>$name</h1>
        <h2>
          ${Reference.external(text: email, link: "mailto:$email")}
        </h2>$twitterPartial
      </article>
""";
  }
}

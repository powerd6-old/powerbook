import 'package:powerbook/mixins.dart';
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
        ? """
      <a
        href="https://twitter.com/$twitter"
        target=_blank
        rel="author"
      >
        @$twitter
      </a>
"""
        : "";
    return """
      <article id="author-${slugify(email)}">
        <h1>$name</h1>
        <h2>
          <a
            href="mailto:$email"
            target=_blank
            rel="author"
          >
            $email
          </a>
        </h2>$twitterPartial
      </article>
""";
  }
}

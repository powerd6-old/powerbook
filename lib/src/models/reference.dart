import 'package:powerbook/models.dart';

/// A reference to content that is elsewhere
class Reference extends Content {
  final String text;
  final String link;
  final String target;

  Reference({required this.text, required this.link, this.target = "_self"});

  /// An internal reference, that will scroll the user to the content without reloading the page.
  Reference.internal(
      {required this.text, required String link, this.target = "_self"})
      : link = "#$link";

  /// An external reference, that will be opened in a new tab by default
  Reference.external(
      {required this.text, required this.link, this.target = "_blank"});

  @override
  String toHtml() {
    return """
      <a href="$link" target="$target">
        $text
      </a>
""";
  }
}

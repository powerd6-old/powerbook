import 'package:powerbook/models.dart';

class Reference extends Content {
  final String text;
  final String link;
  final String target;

  Reference({required this.text, required this.link, this.target = "_self"});

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

import 'package:powerbook/models.dart';
import 'package:powerbook/src/extensions/attribute.dart';
import 'package:powerbook/src/extensions/focus.dart';
import 'package:powerd6/models.dart';

/// A reference to content that is elsewhere
class Reference extends Content {
  final String text;
  final String link;
  final String target;

  Reference({required this.text, required this.link, this.target = "_self"});

  /// An internal reference, that will scroll the user to the content without reloading the page
  Reference.internal(
      {required this.text, required String link, this.target = "_self"})
      : link = "#$link";

  /// An external reference, that will be opened in a new tab by default
  Reference.external(
      {required this.text, required this.link, this.target = "_blank"});

  /// An internal reference, linked to an `Attribute`
  static forAttribute(Attribute attribute) {
    return Reference.internal(text: attribute.name, link: attribute.getId());
  }

  /// An internal reference, linked to a `Focus`
  static forFocus(Focus focus) {
    return Reference.internal(text: focus.name, link: focus.getId());
  }

  @override
  String toHtml() {
    return '<a href="$link" target="$target">' '$text' '</a>';
  }
}

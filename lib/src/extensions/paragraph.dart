import 'package:powerd6/models.dart';

extension ParagraphContent on Paragraph {
  String toHtml() {
    return description.map((e) => '<p>$e</p>').join();
  }
}

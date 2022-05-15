import 'package:powerd6/models.dart';

extension ParagraphContent on Paragraph {
  String toHtml() {
    return lines.map((e) => '<p>$e</p>').join();
  }
}

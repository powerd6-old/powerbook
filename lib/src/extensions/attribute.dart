import 'package:powerbook/src/extensions/focus.dart';
import 'package:powerbook/src/models/heading.dart';
import 'package:powerd6/models.dart';
import 'package:slugify/slugify.dart';

extension AttributeModel on Attribute {
  String getId() {
    return slugify("attribute-$name");
  }

  String toHtml() {
    return '<article id=${getId()}>'
        '${Heading(title: "$number - $name ($abbreviation)").toHtml()}'
        '${description.lines.map((e) => '<p>$e</p>').join()}'
        '<section>'
        '${Heading(title: "Focuses").toHtml()}'
        '${focuses.map((e) => e.toHtml()).join()}'
        '</section>'
        '</article>';
  }
}

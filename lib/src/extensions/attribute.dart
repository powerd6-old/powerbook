import 'package:powerd6/models.dart';
import 'package:slugify/slugify.dart';

extension AttributeModel on Attribute {
  String getId() {
    return slugify("attribute-$name");
  }
}

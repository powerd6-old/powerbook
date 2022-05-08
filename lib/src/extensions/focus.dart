import 'package:powerd6/models.dart';
import 'package:slugify/slugify.dart';

extension FocusModel on Focus {
  String getId() {
    return slugify("focus-$name");
  }
}

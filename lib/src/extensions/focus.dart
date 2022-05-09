import 'package:powerd6/models.dart';
import 'package:slugify/slugify.dart';

extension FocusModel on Focus {
  String getId() {
    return slugify("focus-$name");
  }

  Attribute getAssociatedAttribute() {
    const attributes = [
      Attributes.agility,
      Attributes.charisma,
      Attributes.dexterity,
      Attributes.perception,
      Attributes.strength,
      Attributes.wisdom
    ];
    return attributes.where((element) => element.focuses.contains(this)).first;
  }
}

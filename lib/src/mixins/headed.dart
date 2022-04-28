import 'package:powerbook/models.dart';

/// Headed `Content`s always have one `Heading` element in them.
mixin Headed on Content {
  Heading getHeading();
}

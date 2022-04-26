import 'package:powerbook/models.dart';

class MockContent extends Content {
  MockContent();

  @override
  String toHtml() {
    throw UnimplementedError();
  }
}

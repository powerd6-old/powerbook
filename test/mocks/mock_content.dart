import 'package:powerbook/models.dart';

class MockContent extends Content {
  MockContent() : super(type: "mockContent");

  @override
  String toHtml() {
    throw UnimplementedError();
  }

  @override
  String getId() {
    return "mocked-$hashCode";
  }

  @override
  String getTitle() {
    return "Mocked Content";
  }
}

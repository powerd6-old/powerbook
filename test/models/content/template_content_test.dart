import 'dart:convert';

import 'package:powerbook/models/content/template_content.dart';
import 'package:test/test.dart';

void main() {
  group('deserialization', () {
    test('template-content can be read from JSON', () async {
      String jsonContent =
          '{"type":"template","template":"templateName","data":["folder/file.yaml"]}';
      TemplateContent expected =
          TemplateContent(template: "templateName", data: ["folder/file.yaml"]);

      TemplateContent templateContent =
          TemplateContent.fromJson(jsonDecode(jsonContent));
      expect(templateContent, equals(expected));
    });
  });
  group('serialization', () {
    test('template-content can be written to JSON', () async {
      Map<String, dynamic> expected = jsonDecode(
          '{"type":"template","template":"templateName","data":["folder/file.yaml"]}');
      TemplateContent templateContent =
          TemplateContent(template: "templateName", data: ["folder/file.yaml"]);

      expect(templateContent.toJson(), equals(expected));
    });
  });

  test('template-content checks that all data elements match', () async {
    TemplateContent firstTemplate =
        TemplateContent(template: "templateName", data: ["folder/file.yaml"]);

    TemplateContent copyOfFirstTemplate =
        TemplateContent(template: "templateName", data: ["folder/file.yaml"]);
    TemplateContent secondTemplate = TemplateContent(
        template: "templateName", data: ["folder/another-file.yaml"]);

    expect(firstTemplate, equals(copyOfFirstTemplate));
    expect(firstTemplate, isNot(equals(secondTemplate)));
  });
}

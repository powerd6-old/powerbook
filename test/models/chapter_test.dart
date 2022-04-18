import 'dart:convert';

import 'package:powerbook/models/chapter.dart';
import 'package:powerbook/models/content.dart';
import 'package:test/test.dart';

void main() {
  group('deserialization', () {
    test('chapter without content items can be read from Json', () async {
      String jsonChapter = '{"title": "Introduction","contents": []}';
      Chapter expected = Chapter(title: "Introduction", contents: []);

      Chapter deserialized = Chapter.fromJson(jsonDecode(jsonChapter));

      expect(deserialized, equals(expected));
    });
    test('chapter with content items can be read from Json', () async {
      String jsonMarkdownContent =
          '{"type":"markdown","filepath":"folder/file.md"}';
      MarkdownContent expectedMarkdownContent =
          MarkdownContent(filepath: "folder/file.md");

      String jsonTemplateContent =
          '{"type":"template","template":"templateName","data":["folder/file.yaml"]}';
      TemplateContent expectedTemplateContent =
          TemplateContent(template: "templateName", data: ["folder/file.yaml"]);

      String jsonChapter = '{"title": "Introduction","contents": [' +
          jsonMarkdownContent +
          ',' +
          jsonTemplateContent +
          ']}';
      Chapter expected = Chapter(
          title: "Introduction",
          contents: [expectedMarkdownContent, expectedTemplateContent]);

      Chapter deserialized = Chapter.fromJson(jsonDecode(jsonChapter));

      expect(deserialized, equals(expected));
    });
  });
  group('serialization', () {
    test('chapter without contents can be written to JSON', () async {
      Map<String, dynamic> expected =
          jsonDecode('{"title": "Introduction","contents": []}');
      Chapter chapter = Chapter(title: "Introduction", contents: []);

      expect(chapter.toJson(), equals(expected));
    });
    test('chapter with contents can be written to JSON', () async {
      String jsonMarkdownContent =
          '{"type":"markdown","filepath":"folder/file.md"}';
      MarkdownContent expectedMarkdownContent =
          MarkdownContent(filepath: "folder/file.md");

      String jsonTemplateContent =
          '{"type":"template","template":"templateName","data":["folder/file.yaml"]}';
      TemplateContent expectedTemplateContent =
          TemplateContent(template: "templateName", data: ["folder/file.yaml"]);

      Map<String, dynamic> expected = jsonDecode(
          '{"title": "Introduction","contents": [' +
              jsonMarkdownContent +
              ',' +
              jsonTemplateContent +
              ']}');
      Chapter chapter = Chapter(
          title: "Introduction",
          contents: [expectedMarkdownContent, expectedTemplateContent]);

      expect(chapter.toJson(), equals(expected));
    });
  });
}

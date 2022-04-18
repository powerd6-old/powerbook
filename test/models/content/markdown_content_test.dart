import 'dart:convert';

import 'package:powerbook/models/content/markdown_content.dart';
import 'package:test/test.dart';

void main() {
  group('deserialization', () {
    test('markdown-content can be read from JSON', () async {
      String jsonContent = '{"type":"markdown","filepath":"folder/file.md"}';
      MarkdownContent expected = MarkdownContent(filepath: "folder/file.md");

      MarkdownContent markdownContent =
          MarkdownContent.fromJson(jsonDecode(jsonContent));
      expect(markdownContent, equals(expected));
    });
  });
  group('serialization', () {
    test('markdown-content can be written to JSON', () async {
      Map<String, dynamic> expected =
          jsonDecode('{"type":"markdown","filepath":"folder/file.md"}');
      MarkdownContent markdownContent =
          MarkdownContent(filepath: "folder/file.md");

      expect(markdownContent.toJson(), equals(expected));
    });
  });
}

import 'dart:io';

import 'package:file/memory.dart';
import 'package:powerbook/models/author.dart';
import 'package:powerbook/models/book.dart';
import 'package:powerbook/models/chapter.dart';
import 'package:powerbook/models/content/markdown_content.dart';
import 'package:powerbook/models/content/template_content.dart';
import 'package:powerbook/parser.dart';
import 'package:test/test.dart';

void main() {
  test('parser returns a book when given a valid definition to parse',
      () async {
    final fileContents = '''
title: My Life as a Human Being
subtitle: |-
  A Dragon's Observation on Humanoid Culture.

authors:
  - name: Zabbas Goldenleaf
    email: zabbas.goldenleaf@dragons.com

chapters:
  - title: Introduction
    contents:
      - type: markdown
        filepath: introduction/preface.md

appendices:
  - title: Notable Locations
    contents:
      - type: template
        template: locations
        data:
          - geography.json
''';

    final expected = Book(
        title: "My Life as a Human Being",
        subtitle: "A Dragon's Observation on Humanoid Culture.",
        authors: [
          Author(
              name: "Zabbas Goldenleaf", email: "zabbas.goldenleaf@dragons.com")
        ],
        chapters: [
          Chapter(
              title: "Introduction",
              contents: [MarkdownContent(filepath: "introduction/preface.md")])
        ],
        appendices: [
          Chapter(title: "Notable Locations", contents: [
            TemplateContent(template: "locations", data: ["geography.json"])
          ])
        ]);

    final memoryFileSystem = MemoryFileSystem();
    String filePath = "test-definition.yaml";
    File mockedFile = memoryFileSystem.file(filePath);
    mockedFile.createSync(recursive: true);
    mockedFile.writeAsStringSync(fileContents);

    Parser parser = Parser(fileSystem: memoryFileSystem);

    expect(parser.parseBook(filePath), equals(expected));
  });
}

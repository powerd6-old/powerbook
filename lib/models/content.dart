export 'content/markdown_content.dart' show MarkdownContent;
export 'content/template_content.dart' show TemplateContent;

import 'package:powerbook/models/content/markdown_content.dart';
import 'package:powerbook/models/content/template_content.dart';

abstract class Content {
  final String type;

  Content({required this.type});

  Content.fromJson(Map<String, dynamic> json) : type = json['type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    return data;
  }
}

class ContentMapper {
  static Content fromJson(Map<String, dynamic> dynamicContent) {
    switch (dynamicContent['type']) {
      case 'markdown':
        return MarkdownContent.fromJson(dynamicContent);
      case 'template':
        return TemplateContent.fromJson(dynamicContent);
      default:
        throw UnimplementedError(
            "ContentMapper is not able to map a content of type: " +
                dynamicContent['type']);
    }
  }
}

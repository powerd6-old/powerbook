export 'content/markdown_content.dart' show MarkdownContent;
export 'content/template_content.dart' show TemplateContent;

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

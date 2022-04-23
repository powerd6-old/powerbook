import 'package:collection/collection.dart';
import 'package:powerbook/models/content.dart';

class TemplateContent extends Content {
  final String template;
  final List<String> data;

  TemplateContent({required this.template, required this.data})
      : super(type: 'template');

  TemplateContent.fromJson(Map<String, dynamic> json)
      : template = json['template'],
        data = (json['data'] as List).map((e) => e as String).toList(),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['template'] = template;
    data['data'] = this.data;
    return data;
  }

  @override
  bool operator ==(Object other) {
    return other is TemplateContent &&
        template == other.template &&
        IterableEquality().equals(data, other.data);
  }

  @override
  int get hashCode => template.hashCode + data.hashCode;
}

abstract class Template<T> {
  final List<T> data;

  Template({required this.data});

  String renderHtml();
}

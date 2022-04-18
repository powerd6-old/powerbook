import 'package:powerbook/models/content.dart';

class MarkdownContent extends Content {
  final String filepath;

  MarkdownContent({required this.filepath}) : super(type: 'markdown');

  MarkdownContent.fromJson(Map<String, dynamic> json)
      : filepath = json['filepath'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['filepath'] = filepath;
    return data;
  }

  @override
  bool operator ==(Object other) {
    return other is MarkdownContent && filepath == other.filepath;
  }

  @override
  int get hashCode => filepath.hashCode;
}

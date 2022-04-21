import 'package:collection/collection.dart';
import 'package:powerbook/models/content.dart';

class Chapter {
  final String title;
  final List<Content> contents;

  Chapter({required this.title, required this.contents});

  Chapter.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        contents = (json['contents'] as List<dynamic>)
            .map((e) => ContentMapper.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['contents'] = contents.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  bool operator ==(Object other) {
    return other is Chapter &&
        title == other.title &&
        IterableEquality().equals(contents, other.contents);
  }

  @override
  int get hashCode => title.hashCode + contents.hashCode;
}

import 'package:collection/collection.dart';
import 'package:powerbook/models/author.dart';
import 'package:powerbook/models/chapter.dart';

class Book {
  final String title;
  final String? subtitle;
  final List<Author> authors;
  final List<Chapter> chapters;
  final List<Chapter>? appendices;

  Book(
      {required this.title,
      this.subtitle,
      required this.authors,
      required this.chapters,
      this.appendices});

  Book.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        subtitle = json['subtitle'],
        authors =
            (json['authors'] as List).map((e) => Author.fromJson(e)).toList(),
        chapters =
            (json['chapters'] as List).map((e) => Chapter.fromJson(e)).toList(),
        appendices = (json['appendices'] as List)
            .map((e) => Chapter.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (subtitle != null) {
      data['subtitle'] = subtitle;
    }
    data['authors'] = authors.map((e) => e.toJson()).toList();
    data['chapters'] = chapters.map((e) => e.toJson()).toList();
    if (appendices != null) {
      data['appendices'] = appendices?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) {
    return other is Book &&
        title == other.title &&
        subtitle == other.subtitle &&
        IterableEquality().equals(authors, other.authors) &&
        IterableEquality().equals(chapters, other.chapters) &&
        IterableEquality().equals(appendices, other.appendices);
  }

  @override
  int get hashCode =>
      title.hashCode +
      subtitle.hashCode +
      authors.hashCode +
      chapters.hashCode +
      appendices.hashCode;
}

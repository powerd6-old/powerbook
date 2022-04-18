export 'views/author.dart' show AuthorMeta, AuthorList;

abstract class View<T> {
  final T model;

  View({required this.model});

  String renderHtml();
}

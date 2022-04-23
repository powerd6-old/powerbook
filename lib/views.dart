export 'views/author.dart' show AuthorViewMeta, AuthorViewList;

abstract class View<T> {
  final T model;

  View({required this.model});

  String renderHtml();
}

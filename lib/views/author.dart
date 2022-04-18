import 'package:powerbook/models/author.dart';
import 'package:powerbook/views.dart';

/// Mean to be used in the <head> section of the book
class AuthorMeta extends View<Author> {
  AuthorMeta({required Author model}) : super(model: model);

  @override
  String renderHtml() {
    return '<meta name="author" content="${model.name}">';
  }
}

/// Represents a single Author
class AuthorItem extends View<Author> {
  AuthorItem({required Author model}) : super(model: model);

  @override
  String renderHtml() {
    String twitterHtml = model.twitter != null
        ? '<a href="https://twitter.com/${model.twitter}>@${model.twitter}</a>'
        : '';
    return '''<li class="author">
      <b class="author-name">${model.name}</b>
      <a href="mailto:${model.email}" target="_blank" class="author-email">${model.email}</a>
      $twitterHtml
    </li>''';
  }
}

/// Represents a list of authors
class AuthorList extends View<List<Author>> {
  AuthorList({required List<Author> model}) : super(model: model);

  @override
  String renderHtml() {
    return '''<ul>
      ${model.map((e) => AuthorItem(model: e).renderHtml()).join('')}
    </ul>''';
  }
}

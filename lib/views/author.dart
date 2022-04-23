import 'package:powerbook/models/author.dart';
import 'package:powerbook/views.dart';

/// Meant to be used in the <head> section of the book
class AuthorViewMeta extends View<Author> {
  AuthorViewMeta({required Author model}) : super(model: model);

  @override
  String renderHtml() {
    return '<meta name="author" content="${model.name}">';
  }
}

/// Represents a single Author
class AuthorViewItem extends View<Author> {
  AuthorViewItem({required Author model}) : super(model: model);

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
class AuthorViewList extends View<List<Author>> {
  AuthorViewList({required List<Author> model}) : super(model: model);

  @override
  String renderHtml() {
    return '''<ul>
      ${model.map((e) => AuthorViewItem(model: e).renderHtml()).join('')}
    </ul>''';
  }
}

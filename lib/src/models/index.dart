import 'package:powerbook/mixins.dart';
import 'package:powerbook/src/models/reference.dart';

/// A index that links to all `Indexable` elements provided to it.
class Index with Renderable {
  final List<Indexable> elements;

  Index({required this.elements});

  @override
  String toHtml() {
    return elements.isEmpty
        ? ''
        : '<section id="index">'
            '<ul>${elements.map((e) => getListItem(e)).join()}</ul>'
            '</section>';
  }

  getListItem(Indexable e) {
    return '<li>'
        '${Reference.internal(link: e.getId(), text: e.getTitle()).toHtml()}'
        '${e.getChildren().isEmpty ? "" : "<ul>${e.getChildren().map((e) => getListItem(e)).join()}</ul>"}'
        '</li>';
  }
}

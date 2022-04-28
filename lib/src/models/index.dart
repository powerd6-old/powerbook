import 'package:powerbook/mixins.dart';
import 'package:powerbook/src/models/reference.dart';

/// A index that links to all `Indexable` elements provided to it.
class Index with Renderable {
  final List<Indexable> elements;

  Index({required this.elements});

  @override
  String toHtml() {
    return """
      <section id="index">
        <ul>
          ${elements.map((e) => getListItem(e)).join('\n')}
        </ul>
      </section>
""";
  }

  getListItem(Indexable e) {
    return """
  <li>
    ${Reference.internal(link: e.getId(), text: e.getTitle()).toHtml()}
    ${e.getChildren() != [] ? "<ul>${e.getChildren().map((e) => getListItem(e)).join('\n')}</ul>" : ""}
  </li>
""";
  }
}

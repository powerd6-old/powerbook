import 'package:powerbook/mixins.dart';

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
    <a href="#${e.getId()}">${e.getTitle()}</a>
    ${e.getChildren().map((e) => getListItem(e)).join('\n')}
  </li>
""";
  }
}

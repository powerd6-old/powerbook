import 'package:powerbook/mixins.dart';

/// A generic class that represents a single piece of content
abstract class Content with Renderable, Indexable {
  final String type;

  Content({required this.type});
}
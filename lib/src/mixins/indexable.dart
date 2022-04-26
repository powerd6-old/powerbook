mixin Indexable {
  /// The title with which to refer to the element as
  String getTitle();

  /// The unique Id of the element
  String getId();

  /// An optional list of elements that are children of the current element
  List<Indexable> getChildren() {
    return List.empty();
  }
}

part of dash;

class PolygonAxisCollectionIterator extends Iterator<Vector2> {
  PolygonAxisCollection collection;
  int index = -1;
  
  PolygonAxisCollectionIterator(PolygonAxisCollection this.collection);
  
  get current => collection[index];
  
  bool moveNext() {
    return collection.vertices.length != ++index;
  }
}

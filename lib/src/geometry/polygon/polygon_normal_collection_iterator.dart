part of dash;

class PolygonNormalCollectionIterator extends Iterator<Vector2> {
  PolygonNormalCollection collection;
  int index = -1;
  
  PolygonNormalCollectionIterator(PolygonNormalCollection this.collection);
  
  get current => collection[index];
  
  bool moveNext() {
    return collection.vertices.length != ++index;
  }
}

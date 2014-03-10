part of dash;

class PolygonLineCollectionIterator extends Iterator<LineSegment> {
  PolygonLineCollection collection;
  int index = -1;
  
  PolygonLineCollectionIterator(PolygonLineCollection this.collection);
  
  get current => collection[index];
  
  bool moveNext() {
    return collection.vertices.length != ++index;
  }
}

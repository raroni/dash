part of dash;

class PolygonLineCollection extends Collection.IterableBase {
  List<Point2D> vertices;
  
  PolygonLineCollection(List<Point2D> this.vertices);
  
  Iterator get iterator => new PolygonLineCollectionIterator(this);
  
  LineSegment operator[](int index) {
    var start = this.vertices[index];
    var end = vertices[index+1 == vertices.length ? 0 : index+1];
    return new LineSegment(start, end);
  }
}

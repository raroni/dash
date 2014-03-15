part of dash;

class PolygonNormalCollection extends Collection.IterableBase {
  List<Point2D> vertices;
  
  PolygonNormalCollection(List<Point2D> this.vertices);
  
  Iterator get iterator => new PolygonNormalCollectionIterator(this);
  
  Vector2 operator[](int index) {
    var start = this.vertices[index];
    var end = vertices[index+1 == vertices.length ? 0 : index+1];
    var difference = start-end;
    difference.normalize();
    return new Vector2(difference[1]*-1, difference[0]);
  }
}

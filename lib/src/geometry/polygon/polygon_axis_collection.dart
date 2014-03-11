part of dash;

class PolygonAxisCollection extends Collection.IterableBase {
  List<Point2D> vertices;
  
  PolygonAxisCollection(List<Point2D> this.vertices);
  
  Iterator get iterator => new PolygonAxisCollectionIterator(this);
  
  Vector2 operator[](int index) {
    var start = this.vertices[index];
    var end = vertices[index+1 == vertices.length ? 0 : index+1];
    var difference = start-end;
    difference.normalize();
    return new Vector2(difference[1]*-1, difference[0]);
  }
}

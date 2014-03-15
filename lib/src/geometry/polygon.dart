part of dash;

class Polygon {
  List<Point2D> vertices = new List<Point2D>();
  PolygonLineCollection lines;
  PolygonNormalCollection normals;
  
  Polygon() {
    lines = new PolygonLineCollection(vertices);
    normals = new PolygonNormalCollection(vertices);
  }
  
  Point2D getClosestPoint(Point2D target) {
    Point2D closestPoint;
    Point2D linePoint;
    num shortestDistance = -1;
    
    for(var line in lines) {
      linePoint = line.getClosestPoint(target);
      num distance = target.getSquaredDistance(linePoint);
      if(shortestDistance == -1 || shortestDistance > distance) {
        shortestDistance = distance;
        closestPoint = linePoint;
      }
    }
    
    return closestPoint;
  }
  
  Projection project(Vector2 axis) {
    var min = axis.getDotProduct(vertices[0]);
    var max = min;
    for(var i=1; vertices.length>i; i++) {
      var projection = axis.getDotProduct(vertices[i]);
      if(projection < min) min = projection;
      else if(projection > max) max = projection;
    }
    var projection = new Projection(min, max);
    return projection;
  }
  
  Polygon createClone() {
    var clone = new Polygon();
    for(var vertex in vertices) {
      clone.vertices.add(vertex.createClone());
    }
    return clone;
  }
}

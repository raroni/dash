part of dash;

class Polygon {
  List<Point2D> vertices = new List<Point2D>();
  PolygonLineCollection lines;
  
  Polygon() {
    lines = new PolygonLineCollection(vertices);
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
}

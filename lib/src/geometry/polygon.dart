part of dash;

class Polygon {
  List<Point2D> vertices = new List<Point2D>();
  
  Point2D getClosestPoint(Point2D target) {
    Point2D closestPoint;
    Point2D linePoint;
    LineSegment line = new LineSegment(vertices[0], vertices[1]);
    num shortestDistance = 0;
    
    for(int i=0; vertices.length>i; i++) {
      line.start = vertices[i];
      line.end = vertices[i+1 == vertices.length ? 0 : i+1];
      linePoint = line.getClosestPoint(target);
      num distance = target.getSquaredDistance(linePoint);
      if(i == 0 || shortestDistance > distance) {
        shortestDistance = distance;
        closestPoint = linePoint;
      }
    }
    
    return closestPoint;
  }
}

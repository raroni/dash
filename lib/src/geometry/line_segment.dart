part of dash;

class LineSegment {
  Point2D start;
  Point2D end;
  
  LineSegment(Point2D this.start, Point2D this.end);
  
  String toString() {
    return "${start} - ${end}";
  }
  
  num getSquaredLength() {
    return start.getSquaredDistance(end);
  }
  
  Point2D getClosestPoint(Point2D target) {
    num squaredLength = getSquaredLength();
    if(squaredLength == 0) return start;
    
    Vector2 difference = end - start;
    Vector2 startToTarget = target-start;
    num progress = difference.getDotProduct(startToTarget)/squaredLength;
    
    if(progress < 0) return start;
    if(progress > 1) return end;
    
    Point2D point = start+difference*progress;
    return point;
  }
  
  num getSquaredDistanceToPoint(Point2D target) {
    var closestPoint = getClosestPoint(target);
    return closestPoint.getSquaredDistance(target); 
  }
}

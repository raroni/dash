part of dash;

class Point2D extends Vector2 {
  Point2D(num x, num y) : super(x, y);
  
  Point2D.zero() : super(0, 0);
  
  operator -(Vector2 other) {
    var point = createClone();
    point.subtract(other);
    return point;
  }
  
  operator +(Vector2 other) {
    var point = createClone();
    point.add(other);
    return point;
  }
  
  num getSquaredDistance(Point2D point) {
    var difference = this-point;
    return difference.squaredLength;
  }
  
  Point2D createClone() {
    return new Point2D(this[0], this[1]);
  }
}

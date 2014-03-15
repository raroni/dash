part of dash;

class Projection {
  num min;
  num max;
  
  Projection(num this.min, num this.max);
  
  bool overlaps(Projection projection) {
    if(max <= projection.min) return false;
    if(min >= projection.max) return false;
    return true;
  }

  num getOverlap(projection) {
    var min = Math.max(this.min, projection.min);
    var max = Math.min(this.max, projection.max);
    return max-min;
  }
  
  String toString() {
    return "Projection(${min}, ${max})";
  }
}

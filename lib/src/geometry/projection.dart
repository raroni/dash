part of dash;

class Projection {
  num min;
  num max;
  
  Projection(num this.min, num this.max);
  
  bool overlap(Projection projection) {
    return projection.max >= min && projection.min <= max;
  }
  
  num getOverlap(Projection projection) {
    if(projection.max > max) {
      return max-projection.min;
    } else {
      return min-projection.max;
    }
  }
  
  bool include(Projection projection) {
    return min <= projection.min && max >= projection.max;
  }
  
  String toString() {
    return "Projection(${min}, ${max})";
  }
}

part of dash;

class Vector2 extends Vector {
  Vector2(num x, num y) {
    components = new List<num>(2);
    components[0] = x;
    components[1] = y;
  }
  
  Vector2.zero() {
    components = new List<num>(2);
    components[0] = 0;
    components[1] = 0;
  }
  
  Vector2.normalized(Vector2 vector) {
    components = new List<num>(2);
    components[0] = vector[0];
    components[1] = vector[1];
    normalize();
  }
  
  void negate() {
    this[0] *= -1;
    this[1] *= -1;
  }
  
  String toString() {
    return "${this[0]}, ${this[1]}";
  }
  
  operator +(Vector2 other) {
    var clone = createClone();
    clone.add(other);
    return clone;
  }
  
  operator -(Vector2 other) {
    var clone = createClone();
    clone.subtract(other);
    return clone;
  }
  
  num getDotProduct(Vector2 vector) {
      return components[0]*vector[0] + components[1]*vector[1];
  }
  
  operator*(num factor) {
    var clone = createClone();
    clone.multiply(factor);
    return clone;
  }
  
  operator/(num divident) {
    var clone = createClone();
    clone.divide(divident);
    return clone;
  }
  
  
  
  void add(Vector2 vector) {
    this[0] += vector[0];
    this[1] += vector[1];
  }
  
  void subtract(Vector2 vector) {
    this[0] -= vector[0];
    this[1] -= vector[1];
  }

  Vector2 createClone() {
    var clone = new Vector2.zero();
    clone.set(this);
    return clone;
  }
  
  void multiply(num factor) {
    this[0] *= factor;
    this[1] *= factor;
  }
  
  void divide(num divident) {
    this[0] /= divident;
    this[1] /= divident;
  }
  
  num get length => Math.sqrt(squaredLength);
  
  num get squaredLength => Math.pow(this[0], 2) + Math.pow(this[1], 2);
  
  void reset() {
    this[0] = 0;
    this[1] = 0;
  }
  
  void normalize() {
    set(this/length);
  }
  
  void set(Vector2 vector) {
    this[0] = vector[0];
    this[1] = vector[1];
  }
  
  bool get isZero => this[0] == 0 && this[1] == 0;
}

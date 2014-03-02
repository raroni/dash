part of dash;

class Vector2 extends Vector {
  Vector2([num x = 0, num y = 0]) {
    components = new List<num>(2);
    components[0] = x;
    components[1] = y;
  }
  
  Vector2.normalized(Vector2 vector) {
    components = new List<num>(2);
    components[0] = vector[0];
    components[1] = vector[1];
    normalize();
  }
  
  String toString() {
    return "${this[0]}, ${this[1]}";
  }
  
  operator +(Vector2 other) {
    return new Vector2(
        this[0] + other[0],
        this[1] + other[1]
    );
  }
  
  operator -(Vector2 other) {
    return new Vector2(
        this[0] - other[0],
        this[1] - other[1]
    );
  }
  
  operator*(num factor) {
    return new Vector2(
      this[0] *= factor,
      this[1] *= factor
    );
  }
  
  operator/(num divident) {
    return new Vector2(
      this[0] /= divident,
      this[1] /= divident
    );
  }
  
  void add(Vector2 vector) {
    set(this+vector);     
  }
  
  void subtract(Vector2 vector) {
    set(this-vector);
  }
  
  void multiply(num factor) {
    set(this*factor);
  }
  
  num get length {
    return Math.sqrt(
        Math.pow(this[0], 2) +
        Math.pow(this[1], 2)
    );
  }
  
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

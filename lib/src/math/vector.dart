part of dash;

class Vector {
  List<num> components;
  
  num operator[](int index) {
    return components[index];
  }
  
  void operator []=(int index, num value) {
    components[index] = value;
  }
}

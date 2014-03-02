part of dash;

class ClassIDMap {
  List<Type> list = new List<Type>();
  
  int get(Type type) {
    int id = list.indexOf(type);
    if(id == -1) {
      list.add(type);
      id = list.length-1;
    }
    return id;
  }
}

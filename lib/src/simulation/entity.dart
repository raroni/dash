part of dash;

class Entity {
  int id;
  Database database;
  
  Entity(this.id, this.database);
  
  Aspect createAspect(Type type) {
    return database.createAspect(this.id, type);
  }
  
  bool has(Type type) {
    return database.hasAspect(id, type);
  }
  
  Aspect getAspect(Type type) {
    return database.getAspect(id, type);
  }
  
  void destroy() {
    database.destroyEntity(this);
  }
}

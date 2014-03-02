part of dash;

class Entity {
  int id;
  Database database;
  
  Entity(this.id, this.database);
  
  Component createComponent(Type type) {
    return database.createComponent(this.id, type);
  }
  
  bool has(Type type) {
    return database.hasComponent(id, type);
  }
  
  Component getComponent(Type type) {
    return database.getComponent(id, type);
  }
}

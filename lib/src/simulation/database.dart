part of dash;

class Database {
  List<Entity> entities = new List<Entity>();
  List<Entity> additions = new List<Entity>();
  List<Entity> pendingDestructions = new List<Entity>();
  ClassIDMap componentTypeIDs = new ClassIDMap();
  EventManager eventManager;
  int nextUnusedID = 0;
  List<int> freedIDs = new List<int>();
  List<List<Component>> componentLists = new List<List<Component>>();
  Database(EventManager this.eventManager);
  
  Entity createEntity() {
    int id;
    
    if(freedIDs.isNotEmpty) {
      id = freedIDs.removeLast();
    } else {
      id = nextUnusedID++;
      reallocate();
    }
    
    var entity = new Entity(id, this);
    entities.add(entity);
    additions.add(entity);
    return entity;
  }
  
  void reallocate() {
    for(var componentList in componentLists) {
      componentList.length = getSize();
    }
  }
  
  void destroyEntity(entity) {
    pendingDestructions.add(entity);
  }
  
  bool hasComponent(int entityID, Type type) {
    var list = getComponentList(type);
    return list[entityID] != null;
  }
  
  Component createComponent(int entityID, Type type) {
    if(hasComponent(entityID, type)) throw new StateError("Entity already has this component.");
    var reflection = Mirrors.reflectClass(type);
    Component component = reflection.newInstance(new Symbol(''), []).reflectee;
    
    List<Component> list = getComponentList(type);
    list[entityID] = component;
    return component;
  }
  
  int getSize() {
    return nextUnusedID;
  }
  
  List<Component> getComponentList(Type type) {
    int componentTypeID = componentTypeIDs.get(type);
    if(componentLists.length <= componentTypeID) {
      componentLists.length = componentTypeID+1;
    }
    List<Component> list = componentLists[componentTypeID];
    if(list == null) {
      list = new List<Component>();
      list.length = getSize();
      componentLists[componentTypeID] = list;
    }
    return list;
  }
  
  Component getComponent(int entityID, Type type) {
    List<Component> list = getComponentList(type);
    return list[entityID];
  }
  
  void update() {
    for(var entity in additions) {
      eventManager.emit(new EntityAddition(entity));
    }
    additions.clear();
    
    for(var entity in pendingDestructions) {
      eventManager.emit(new EntityDestruction(entity));
    }
    pendingDestructions.clear();
  }
}

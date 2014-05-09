part of dash;

class Database {
  List<Entity> entities = new List<Entity>();
  List<Entity> additions = new List<Entity>();
  List<Entity> pendingDestructions = new List<Entity>();
  Set<int> changes = new Set<int>(); 
  ClassIDMap aspectTypeIDs = new ClassIDMap();
  EventManager eventManager;
  int nextUnusedID = 0;
  List<int> freedIDs = new List<int>();
  List<List<Aspect>> aspectLists = new List<List<Aspect>>();
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
    for(var aspectList in aspectLists) {
      aspectList.length = getSize();
    }
  }
  
  void destroyEntity(Entity entity) {
    pendingDestructions.add(entity);
  }
  
  bool hasAspect(int entityID, Type type) {
    var list = getAspectList(type);
    return list[entityID] != null;
  }
  
  Aspect createAspect(int entityID, Type type) {
    if(hasAspect(entityID, type)) throw new StateError("Entity already has this aspect.");
    changes.add(entityID);
    
    var reflection = Mirrors.reflectClass(type);
    Aspect aspect = reflection.newInstance(new Symbol(''), []).reflectee;
    
    List<Aspect> list = getAspectList(type);
    list[entityID] = aspect;
    return aspect;
  }
  
  int getSize() {
    return nextUnusedID;
  }
  
  List<Aspect> getAspectList(Type type) {
    int aspectTypeID = aspectTypeIDs.get(type);
    if(aspectLists.length <= aspectTypeID) {
      aspectLists.length = aspectTypeID+1;
    }
    List<Aspect> list = aspectLists[aspectTypeID];
    if(list == null) {
      list = new List<Aspect>();
      list.length = getSize();
      aspectLists[aspectTypeID] = list;
    }
    return list;
  }
  
  Aspect getAspect(int entityID, Type type) {
    List<Aspect> list = getAspectList(type);
    return list[entityID];
  }
  
  void update() {
    for(var entity in additions) {
      eventManager.emit(new EntityAddition(entity));
      changes.remove(entity.id);
    }
    additions.clear();
    
    for(var entity in pendingDestructions) {
      eventManager.emit(new EntityDestruction(entity));
      changes.remove(entity.id);
    }
    pendingDestructions.clear();
    
    for(var entityIDs in changes) {
      eventManager.emit(new EntityChange(entities[entityIDs]));
    }
    changes.clear();
  }
}

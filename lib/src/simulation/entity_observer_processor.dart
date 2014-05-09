part of dash;

abstract class EntityObserverProcessor extends Processor {
  List<Entity> entities = new List<Entity>();
  
  void onProcessorInitialized() {
    eventSubscriptionManager.add(EntityAddition, receiveEntityAddition);
    eventSubscriptionManager.add(EntityDestruction, receiveEntityDestruction);
    eventSubscriptionManager.add(EntityChange, receiveEntityChange);
    onEntityObserverProcessorInitialized();
  }
  
  void receiveEntityAddition(EntityAddition addition) {
    var entity = addition.entity;
    if(match(entity)) {
      add(entity);
    }
  }
  
  void add(Entity entity) {
    entities.add(entity);
    onAddition(entity);
  }
  
  void receiveEntityDestruction(EntityDestruction destruction) {
    var entity = destruction.entity;
    if(entities.contains(entity)) {
      remove(entity);
    }
  }
  
  void remove(Entity entity) {
    entities.remove(entity);
    onRemoval(entity);
  }
  
  void receiveEntityChange(EntityChange change) {
    var entity = change.entity;
    var isAdded = entities.contains(entity);
    
    if(match(entity)) {
      if(!isAdded) add(entity);
    }
    else if(isAdded) {
      remove(entity);
    }
  }
  
  bool match(Entity entity);
  void onAddition(Entity entity);
  void onRemoval(Entity entity);
  void onEntityObserverProcessorInitialized() { }
}

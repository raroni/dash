part of dash;

abstract class EntityObserverProcessor extends Processor {
  List<Entity> entities = new List<Entity>();
  
  void onProcessorInitialized() {
    eventSubscriptionManager.add(EntityAddition, receiveEntityAddition);
    eventSubscriptionManager.add(EntityDestruction, receiveEntityDestruction);
    onEntityObserverProcessorInitialized();
  }
  
  void receiveEntityAddition(EntityAddition addition) {
    var entity = addition.entity;
    if(match(entity)) {
      entities.add(entity);
      onAddition(entity);
    }
  }
  
  void receiveEntityDestruction(EntityDestruction destruction) {
    var entity = destruction.entity;
    if(entities.contains(entity)) {
      onRemoval(entity);
    }
  }
  
  bool match(Entity entity);
  void onAddition(Entity entity);
  void onRemoval(Entity entity);
  void onEntityObserverProcessorInitialized() { }
}

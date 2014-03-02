part of dash;

abstract class EntityProcessor extends EntityObserverProcessor {
  // EntityObserverProcessor will probably provide this list in the future, but for now we'll make it outselves.
  List<Entity> entities = new List<Entity>();
  
  void onEntityObserverProcessorInitialized() {
    eventSubscriptionManager.add(Update, receiveUpdate);
  }
  
  void receiveUpdate(Update update) {
    for(var entity in entities) {
      updateEntity(entity);
    }
  }
  
  void onAddition(Entity entity) {
    entities.add(entity);
  }
  
  void onRemoval(Entity entity) {
    entities.remove(entity);
  }
  
  bool match(Entity entity);
  void updateEntity(Entity entity);
}

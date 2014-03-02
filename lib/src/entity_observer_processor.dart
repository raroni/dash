part of dash;

abstract class EntityObserverProcessor extends Processor {
  EventSubscriptionManager eventSubscriptionManager;
  List<Entity> entities = new List<Entity>();
  
  void initialize() {
    eventSubscriptionManager = new EventSubscriptionManager(eventManager);
    eventSubscriptionManager.add(EntityAddition, receiveEntityAddition);
    eventSubscriptionManager.add(EntityDestruction, receiveEntityDestruction);
    onInitialize();
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
  void onInitialize() { }
  
  void terminate() {
    eventSubscriptionManager.terminate();
  }
}

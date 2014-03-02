part of dash;

class CollisionDetection extends EntityObserverProcessor {
  List<Entity> staticCircleEntities = new List<Entity>();
  List<Entity> dynamicCircleEntities = new List<Entity>();
  PairCache<Entity> pairCache = new PairCache<Entity>(); 
  
  bool match(Entity entity) {
    return entity.has(CircleCollider);
  }
  
  void onEntityObserverProcessorInitialized() {
    eventSubscriptionManager.add(Update, receiveUpdate);
  }
  
  void receiveUpdate(Update update) {
    for(var entity1 in dynamicCircleEntities) {
      for(var entity2 in dynamicCircleEntities) {
        if(entity1 != entity2 && !pairCache.contains(entity1, entity2)) {
          testCircleCollision(entity1, entity2);
          pairCache.add(entity1, entity2);
        }
      }
      
      for(var entity2 in staticCircleEntities) {
        testCircleCollision(entity1, entity2);
      }
    }
    pairCache.clear();
  }
  
  void testCircleCollision(Entity entity1, Entity entity2) {
    var position1 = entity1.getComponent(Position);
    var position2 = entity2.getComponent(Position);
    var centerDif = position1.vector - position2.vector;
    
    var distance = centerDif.length;
    
    var collider1 = entity1.getComponent(CircleCollider);
    var collider2 = entity2.getComponent(CircleCollider);
    var overlap = collider1.radius+collider2.radius-distance;
    if(overlap > 0) {
      var separation = new Vector2.normalized(centerDif)*overlap;
      eventManager.emit(new Collision(entity1, entity2, separation));
    }
  }
  
  void onAddition(Entity entity) {
    if(entity.has(Velocity)) {
      dynamicCircleEntities.add(entity);
    } else {
      staticCircleEntities.add(entity);
    }
  }
  
  void onRemoval(Entity entity) {
    throw new StateError("Not implemented yet.");
  }
}

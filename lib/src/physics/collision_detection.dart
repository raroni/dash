part of dash;

class CollisionDetection extends EntityObserverProcessor {
  List<Entity> staticCircleEntities = new List<Entity>();
  List<Entity> dynamicCircleEntities = new List<Entity>();
  List<Entity> dynamicPolygonEntities = new List<Entity>();
  PairCache<Entity> pairCache = new PairCache<Entity>(); 
  
  bool match(Entity entity) {
    return entity.has(CircleCollider) || entity.has(PolygonCollider);
  }
  
  void onEntityObserverProcessorInitialized() {
    eventSubscriptionManager.add(Update, receiveUpdate);
  }
  
  void receiveUpdate(Update update) {
    for(var entity1 in dynamicCircleEntities) {
      for(var entity2 in dynamicCircleEntities) {
        if(entity1 != entity2 && !pairCache.contains(entity1, entity2)) {
          testCircles(entity1, entity2);
          pairCache.add(entity1, entity2);
        }
      }
      for(var entity2 in dynamicPolygonEntities) {
        testCirclePolygon(entity1, entity2);
      }
      
      for(var entity2 in staticCircleEntities) {
        testCircles(entity1, entity2);
      }
    }
    pairCache.clear();
    
    for(var entity1 in dynamicPolygonEntities) {
      for(var entity2 in dynamicPolygonEntities) {
        if(entity1 != entity2 && !pairCache.contains(entity1, entity2)) {
          testPolygons(entity1, entity2);
          pairCache.add(entity1, entity2);
        }
      }
      for(var entity2 in staticCircleEntities) {
        testCirclePolygon(entity2, entity1);
      }
    }
    pairCache.clear();
  }
  
  void testCircles(Entity entity1, Entity entity2) {
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
  
  void testPolygons(Entity entity1, Entity entity2) {
    // not implemented yet
  }
  
  void testCirclePolygon(Entity circleEntity, Entity polygonEntity) {
    var circlePosition = circleEntity.getComponent(Position);
    var polygonPosition = polygonEntity.getComponent(Position);
    
    var circlePositionRelativeToPolygon = circlePosition.vector - polygonPosition.vector;
    
    var polygonCollider = polygonEntity.getComponent(PolygonCollider);
    var closestPointOnPolygon = polygonCollider.polygon.getClosestPoint(circlePositionRelativeToPolygon);
    
    var difference = circlePositionRelativeToPolygon-closestPointOnPolygon;
    var distance = difference.length;
    
    var circleCollider = circleEntity.getComponent(CircleCollider);
    if(distance < circleCollider.radius) {
      difference.normalize();
      var separation = difference * (circleCollider.radius-distance);
      eventManager.emit(new Collision(circleEntity, polygonEntity, separation));
    }
  }
  
  void onAddition(Entity entity) {
    if(entity.has(PolygonCollider)) {
      if(!entity.has(Velocity)) throw new StateError("We don't support static polygon collider.");
      dynamicPolygonEntities.add(entity);
    } else {
      if(entity.has(Velocity)) {
        dynamicCircleEntities.add(entity);
      } else {
        staticCircleEntities.add(entity);
      } 
    }
  }
  
  void onRemoval(Entity entity) {
    throw new StateError("Not implemented yet.");
  }
}

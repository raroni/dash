part of dash;

class CollisionDetection extends EntityObserverProcessor {
  List<Entity> staticCircleEntities = new List<Entity>();
  List<Entity> dynamicCircleEntities = new List<Entity>();
  List<Entity> staticPolygonEntities = new List<Entity>();
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
      for(var entity2 in staticCircleEntities) {
        testCircles(entity1, entity2);
      }
      for(var entity2 in dynamicPolygonEntities) {
        testCirclePolygon(entity1, entity2);
      }
      for(var entity2 in staticPolygonEntities) {
        testCirclePolygon(entity1, entity2);
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
      for(var entity2 in staticPolygonEntities) {
        testPolygons(entity1, entity2);
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
    var separation1 = findSmallestPolygonSeparation(entity1, entity2);
    if(separation1 == null) return;
    var separation2 = findSmallestPolygonSeparation(entity2, entity1);
    if(separation2 == null) return;
    
    var separation;
    if(separation1.squaredLength < separation2.squaredLength) {
      separation = separation1*-1;
    } else {
      separation = separation2;
    }
    
    eventManager.emit(new Collision(entity1, entity2, separation));
  }
  
  Vector2 findSmallestPolygonSeparation(Entity entity1, Entity entity2) {
    var smallestSeparationDistance, smallestSeparationDirection;
    
    var collider1 = entity1.getComponent(PolygonCollider);
    var collider2 = entity2.getComponent(PolygonCollider);
    
    var polygon1 = collider1.polygon;
    var polygon2 = collider2.polygon.createClone();
    var position1 = entity1.getComponent(Position);
    var position2 = entity2.getComponent(Position);
    polygon2.translate(position2.vector - position1.vector);
    
    for(var normal in collider1.polygon.normals) {
      var projection1 = polygon1.project(normal);
      var projection2 = polygon2.project(normal);
      
      if(projection1.include(projection2)) {
        // Not implemented yet.
      } else {
        if(!projection1.overlap(projection2)) return null;
        var overlap = projection1.getOverlap(projection2);
        if(smallestSeparationDistance == null || smallestSeparationDistance.abs() > overlap.abs()) {
          smallestSeparationDistance = overlap;
          smallestSeparationDirection = normal;
        }
      }
    }
    
    var separation = smallestSeparationDirection * smallestSeparationDistance;
    return separation;
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
      if(entity.has(Velocity)) {
        dynamicPolygonEntities.add(entity);
      } else {
        staticPolygonEntities.add(entity);
      }
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

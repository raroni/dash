part of dash;

class CollisionResolution extends Processor {
  List<Collision> pendingCollisions = new List<Collision>();
  
  void onProcessorInitialized() {
    eventSubscriptionManager.add(Collision, receiveCollision);
    eventSubscriptionManager.add(Update, receiveUpdate);
  }
  
  void receiveCollision(Collision collision) {
    pendingCollisions.add(collision);
  }
  
  void receiveUpdate(Update update) {
    for(var collision in pendingCollisions) {
      var entity1Static = !collision.entity1.has(Velocity);
      var entity2Static = !collision.entity2.has(Velocity);
      
      var baseChange = collision.separation*1.01;
      
      if(entity1Static) {
        move(collision.entity2, baseChange * -1);
      }
      else if(entity2Static) {
        move(collision.entity1, baseChange);
      } else {
        var halfSeparation = baseChange*0.5;
        move(collision.entity1, halfSeparation);
        move(collision.entity2, halfSeparation * -1);
      }
    }
    
    pendingCollisions.clear();
  }
  
  void move(Entity entity, Vector2 change) {
    var position = entity.getComponent(Position);
    position.vector.add(change);
    var velocityAspect = entity.getComponent(Velocity);
    if(change[0].abs() > change[1].abs()) {
      velocityAspect.vector[0] = 0;
      velocityAspect.vector[1] *= 0.8;
    } else {
      velocityAspect.vector[1] = 0;
      velocityAspect.vector[0] *= 0.8;
    }
  }
}

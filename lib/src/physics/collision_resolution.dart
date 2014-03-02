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
      var halfSeparation = collision.separation*0.501;
      
      var position1 = collision.entity1.getComponent(Position);
      position1.vector.add(halfSeparation);
      
      var position2 = collision.entity2.getComponent(Position);
      position2.vector.subtract(halfSeparation);
    }
    pendingCollisions.clear();
  }
}

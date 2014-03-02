part of dash;

class CollisionResolution extends Processor {
  Async.StreamSubscription subscription1;
  Async.StreamSubscription subscription2;
  List<Collision> pendingCollisions = new List<Collision>();
  
  void initialize() {
    subscription1 = eventManager.getStream(Collision).listen(receiveCollision);
    subscription2 = eventManager.getStream(Update).listen(receiveUpdate);
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
  
  void terminate() {
    subscription1.cancel();
    subscription2.cancel();
  }
}

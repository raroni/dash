part of dash;

class Movement extends EntityProcessor {
  bool match(Entity entity) {
    return entity.has(Velocity);
  }
  
  void updateEntity(Entity entity, Update update) {
    var velocity = entity.getComponent(Velocity);
    var position = entity.getComponent(Position);
    position.vector.add(velocity.vector);
  }
}

part of dash;

class Collision extends Event {
  Entity entity1;
  Entity entity2;
  Vector2 separation;
  
  Collision(Entity this.entity1, Entity this.entity2, Vector2 this.separation) { }
}

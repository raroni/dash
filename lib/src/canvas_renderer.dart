part of dash;

class CanvasRenderer extends EntityObserverProcessor {
  HTML.CanvasElement canvas = new HTML.CanvasElement();
  HTML.CanvasRenderingContext2D context;
  List<Entity> circleEntities = new List<Entity>();
  
  Color clearColor = new Color.black();
  
  CanvasRenderer() {
    canvas.width = 800;
    canvas.height= 600;
    context = canvas.getContext('2d');
  }
  
  void onEntityObserverProcessorInitialized() {
    eventSubscriptionManager.add(Update, receiveUpdate);
  }
  
  void receiveUpdate(Update update) {
    context.fillStyle = HTMLHelper.formatAsRGBA(clearColor);
    context.fillRect(0, 0, canvas.width, canvas.height);
    
    for(var entity in circleEntities) {
      CircleRendering circle = entity.getComponent(CircleRendering);
      Position position = entity.getComponent(Position);
      
      context.fillStyle = HTMLHelper.formatAsRGBA(circle.color);
      context.beginPath();
      context.arc(position.x, position.y, circle.radius, 0, Math.PI*2, true);
      context.closePath();
      context.fill();
    }
  }
  
  void onRemoval(Entity entity) {
    circleEntities.remove(entity);
  }
  
  bool match(Entity entity) {
    return entity.has(CircleRendering);
  }
  
  void onAddition(Entity entity) {
    circleEntities.add(entity);
  }
}

part of dash;

abstract class Game {
  double lastTickTime = 0.0;
  HTML.Element container;
  RenderingSetup renderingSetup;
  
  Game(HTML.Element this.container);
  
  void run() {
    tick(0.0);
  }
  
  void tick(double time) {
    double timeDelta = time-lastTickTime;
    lastTickTime = time;
    if(timeDelta < 80) {
      update(timeDelta);
    }
    scheduleNextFrame();
  }
  
  void scheduleNextFrame() {
    HTML.window.animationFrame.then(tick);
  }
  
  void initialize() {
    renderingSetup = new RenderingSetup();
    container.nodes.add(renderingSetup.canvas);
    
    onInitialized();
  }
  
  void onInitialized();
  
  void update(num timeDelta);
}

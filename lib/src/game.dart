part of dash;

abstract class Game {
  double lastTickTime = 0.0;
  
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
  
  void initialize() { }
  
  void update(num timeDelta);
}

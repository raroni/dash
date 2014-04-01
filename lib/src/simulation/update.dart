part of dash;

class Update extends Event {
  double simulationDuration;
  double frameDuration;
  
  Update(double this.simulationDuration, double this.frameDuration);
}

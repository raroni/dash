part of dash;

class Simulation {
  List<Processor> processors = new List<Processor>();
  EventManager eventManager = new EventManager();
  Database database;
  
  Simulation() {
    database = new Database(eventManager);
  }
  
  void initialize() {
    for(var processor in processors) {
      processor.eventManager = eventManager;
      processor.initialize();
    }
  }
  
  void addProcessor(Processor processor) {
    processors.add(processor);
  }
  
  void progress(double timeDelta) {
    database.update();
    eventManager.emit(new Update(timeDelta));
  }
  
  Entity createEntity() {
    return database.createEntity();
  }
  
  void destroyEntity(Entity entity) {
    database.destroyEntity(entity);
  }
}

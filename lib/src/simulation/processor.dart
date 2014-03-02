part of dash;

class Processor {
  EventManager eventManager;
  EventSubscriptionManager eventSubscriptionManager;
  
  void initialize() {
    eventSubscriptionManager = new EventSubscriptionManager(eventManager);
    onProcessorInitialized();
  }
  
  void onProcessorInitialized() { }
  
  void terminate() {
    eventSubscriptionManager.terminate();
  }
}

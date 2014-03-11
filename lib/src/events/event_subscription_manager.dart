part of dash;

class EventSubscriptionManager {
  EventManager eventManager;
  
  List<EventSubscription> subscriptions = new List<EventSubscription>();
  
  EventSubscriptionManager(EventManager this.eventManager);
  
  void add(Type type, Function function) {
    var subscription = eventManager.subscribe(type, function);
    subscriptions.add(subscription);
  }
  
  void terminate() {
    for(var subscription in subscriptions) {
      subscription.cancel();
    }
  }
}

part of dash;

class EventSubscriptionManager {
  EventManager eventManager;
  
  List<Async.StreamSubscription> subscriptions = new List<Async.StreamSubscription>();
  
  EventSubscriptionManager(EventManager this.eventManager);
  
  void add(Type type, Function function) {
    var subscription = eventManager.getStream(type).listen(function);
    subscriptions.add(subscription);
  }
  
  void terminate() {
    for(var subscription in subscriptions) {
      subscription.cancel();
    }
  }
}

part of dash;

class EventSubscription {
  EventManager manager;
  Type type;
  Function function;
  
  EventSubscription(EventManager this.manager, Type this.type, Function this.function);
  
  void cancel() {
    throw new StateError('Not impl.');
  }
}

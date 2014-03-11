part of dash;

class EventManager { 
  Map<Type, List<Function>> callbacks = new Map<Type, List<Function>>();
  
  void emit(Event event) {
    var list = getList(event.runtimeType);
    for(var callback in list) {
      callback(event);
    }
  }
  
  List<Function> getList(Type type) {
    var list = callbacks[type];
    if(list == null) {
      list = new List<Function>();
      callbacks[type] = list;
    }
    return list;
  }
  
  EventSubscription subscribe(Type type, Function function) {
    getList(type).add(function);
    var subscription = new EventSubscription(this, type, function);
    return subscription;
  }
}

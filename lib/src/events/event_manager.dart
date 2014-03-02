part of dash;

class StreamPair {
  Async.StreamController controller;
  Async.Stream stream;
  
  StreamPair() {
    controller = new Async.StreamController.broadcast(sync: true); 
    stream = controller.stream;
  }
}

class EventManager { 
  Map<Type, StreamPair> pairs = new Map<Type, StreamPair>();
  
  void emit(Event event) {
    var pair = getPair(event.runtimeType);
    pair.controller.add(event);
  }
  
  StreamPair getPair(Type type) {
    StreamPair pair;
    pair = pairs[type];
    if(pair== null) {
      pair = new StreamPair();
      pairs[type] = pair;
    }
    return pair;
  }
  
  Async.Stream getStream(Type type) {
    return getPair(type).stream;
  }
}

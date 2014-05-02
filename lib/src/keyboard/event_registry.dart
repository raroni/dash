part of dash;

class KeyboardEventRegistry {
  List<String> keyDowns = new List<String>();
  List<String> keyUps = new List<String>();
  
  void registerKeyDown(String keyName) {
    keyDowns.add(keyName);
  }
  
  void registerKeyUp(String keyName) {
    keyUps.add(keyName);
  }
  
  bool hasKeyDown(String keyName) {
    return keyDowns.contains(keyName);
  }

  bool hasKeyUp(String keyName) {
    return keyUps.contains(keyName);
  }
  
  void clear() {
    keyDowns.clear();
    keyUps.clear();
  }
}

part of dash;

class KeyboardEventRegistry {
  List<String> keyDowns = new List<String>();
  
  void registerKeyDown(String keyName) {
    keyDowns.add(keyName);
  }
  
  bool hasKeyDown(String keyName) {
    return keyDowns.contains(keyName);
  }
  
  void clear() {
    keyDowns.clear();
  }
}

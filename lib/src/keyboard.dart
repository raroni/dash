part of dash;

class Keyboard {
  var keyMap = {
    32: 'space',
    37: 'left',
    38: 'up',
    39: 'right',
    40: 'down',
    65: 'a',
    66: 'b',
    67: 'c',
    68: 'd',
    69: 'e',
    70: 'f',
    71: 'g',
    72: 'h',
    73: 'i',
    74: 'j',
    75: 'k',
    76: 'l',
    77: 'm',
    78: 'n',
    79: 'o',
    80: 'p',
    81: 'q',
    82: 'r',
    83: 's',
    84: 't',
    85: 'u',
    86: 'v',
    87: 'w',
    88: 'x',
    89: 'y',
    90: 'z',
  };
  
  Map<String, bool> keysPressed = new Map<String, bool>();
  
  Keyboard() {
    HTML.document.body.onKeyDown.listen(onKeyDown);
    HTML.document.body.onKeyUp.listen(onKeyUp);
  }
  
  void onKeyDown(HTML.KeyboardEvent event) {
    var keyName = keyMap[event.keyCode];
    if(keyName != null) {
      keysPressed[keyName] = true;
    }
  }
  
  bool keyPressed(String keyName) {
    return keysPressed.containsKey(keyName);
  }
  
  void onKeyUp(HTML.KeyboardEvent event) {
    var keyName = keyMap[event.keyCode];
    if(keyName != null) {
      keysPressed.remove(keyName);
    }
  }
}

class type {
  boolean iITF = false, pressedT;
  float x, y, h, w;
  String t;
  type(float xb, float yb, float wb, float hb, String st) {
    x = xb;
    y = yb;
    h = hb; 
    w = wb;
    t = st;
  }

  void isTyping() {
    if (Button(x, y, w, h)) {
      if (iITF == false) {
        iITF = true;
        t = "";
      } else if (iITF == true) {
        iITF = false;
      }
    } else if(keyDetection(ENTER)){
      iITF = false;
    }
  }

  void typing() {
    if (iITF) {
      if (keyPressed && !pressedT) {
      if (key != BACKSPACE && key != ENTER) {
        t += key;
      } else if (key == BACKSPACE) {
        t = "";
      }
      pressedT = true;
    } else if (!keyPressed && pressedT) {
      pressedT = false;
    }
    }
  }
  void render() {
    fill(255);
    rect(x, y, w, h);
    fill(0);
    if (iITF) {
      text(t +"|", x, y, w, h);
    } else {
      text(t, x, y, w, h);
    }
  }
}

class creator {
  int Type = 0, ClickedNR = 0, CheckClick = 0;
  boolean PressedR = false;

  creator() {
  }

  void render() {
    for(int i = 0;i <= width; i+=grid){
      for(int j = 0; j <= height; j+=grid){
        noFill();
        stroke(100);
        rect(i, j, grid, grid);
      }
    }
    for (int i = 0; i <= ClickedNR; i++) {
      fill(0, 187, 255);
      rectG(rectanglex[i], rectangley[i], rectanglesx[i], rectanglesy[i]);
    }
  }

  void user() {
    if (Type == 0 && CheckClick == 0 && !PressedR && mousePressed) {
      ClickedNR++;
      rectanglex[ClickedNR] = floor(mouseX / grid);
      rectangley[ClickedNR] = floor(mouseY / grid);
      CheckClick = 1;
      PressedR = true;
    } else if (Type == 0 && CheckClick == 1 && !PressedR && mousePressed) {
      rectanglesx[ClickedNR] = floor((mouseX / grid) - rectanglex[ClickedNR]);
      rectanglesy[ClickedNR] = floor((mouseY / grid) - rectangley[ClickedNR]);
      CheckClick = 0;
      PressedR = true;
    } else if (Type == 1 && !PressedR && mousePressed) {
    } else if (PressedR && !mousePressed) {
      PressedR = false;
    }
  }
}

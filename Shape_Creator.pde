class creator {
  float tempx = 0, tempy = 0, cursorx, cursory;
  int Type = 0, ClickedNR = 0, ClickedNC = 0, CheckClick = 0;
  boolean PressedR = false, showGrid = false;
  ;

  creator() {
  }

  void render() {
    fill(0);
    if (Type == 0 && CheckClick == 0) {
      rect(floor(mouseX / grid) * grid, floor(mouseY / grid) * grid, grid, grid);
    } else if (Type == 0 && CheckClick == 1) {
      rect(tempx, tempy, (floor(mouseX / grid + 1) * grid) - tempx, (floor(mouseY / grid + 1) * grid) - tempy);
    }

    if (Type == 1 && CheckClick == 0) {
      ellipse(floor(mouseX / grid) * grid + grid / 2, floor(mouseY / grid) * grid + grid / 2, 1, 1);
    } else if (Type == 1 && CheckClick == 1) {
      ellipse(tempx, tempy, (floor(mouseX / grid) * grid + grid / 2) - tempx, (floor(mouseX / grid) * grid + grid / 2) - tempx);
    }

    for (int i = 0; i <= ClickedNR; i++) {
      fill(0);
      rectG(rectanglex[i], rectangley[i], rectanglesx[i], rectanglesy[i]);
    }

    for (int i = 0; i <= ClickedNC; i++) {
      fill(0);
      ellipse(Circlex[i] * grid, Circley[i] * grid, Circler[i] * grid, Circler[i] * grid);
    }

    if (showGrid) {
      for (int i = 0; i <= width; i+=grid) {
        for (int j = 0; j <= height; j+=grid) {
          noFill();
          stroke(100);
          rect(i, j, grid, grid);
        }
      }
    }
  }

  void user() {
    if (Type == 0 && CheckClick == 0 && !PressedR && mousePressed) {
      ClickedNR++;
      rectanglex[ClickedNR] = floor(mouseX / grid);
      rectangley[ClickedNR] = floor(mouseY / grid);
      CheckClick = 1;
      tempx = floor(mouseX / grid) * grid;
      tempy = floor(mouseY / grid) * grid;
      PressedR = true;
    } else if (Type == 0 && CheckClick == 1 && !PressedR && mousePressed) {
      rectanglesx[ClickedNR] = floor((mouseX / grid + 1) - rectanglex[ClickedNR]);
      rectanglesy[ClickedNR] = floor((mouseY / grid + 1) - rectangley[ClickedNR]);
      CheckClick = 0;
      PressedR = true;
    } else if (Type == 1 && CheckClick == 0 && !PressedR && mousePressed) {
      ClickedNC++;
      Circlex[ClickedNC] = (floor(mouseX / grid)) + 0.5;
      Circley[ClickedNC] = (floor(mouseY / grid)) + 0.5;
      CheckClick = 1;
      tempx = floor(mouseX / grid) * grid + grid / 2;
      tempy = floor(mouseY / grid) * grid + grid / 2;
      PressedR = true;
    } else if (Type == 1 && CheckClick == 1 && !PressedR && mousePressed) {
      Circler[ClickedNC] = floor(mouseX / grid) - Circlex[ClickedNC] + 0.5;
      CheckClick = 0;
      PressedR = true;
    } else if (PressedR && !mousePressed) {
      PressedR = false;
    }
  }
}

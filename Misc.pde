boolean Pressed = false, P4essed = false, ggfdsakfjd = false;
//sqrt((w*w)+(h*h)) / 5
boolean Button(String text, float x, float y, float w, float h, float textSize) {
  boolean t = false;
  fill(255);
  rect(x, y, w, h, 5);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(textSize);
  text(text, x, y, w, h);
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h && mousePressed && !Pressed) {
    Pressed = true;
  } else if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h  && !mousePressed && Pressed) {
    Pressed = false; 
    t = true;
  }
  return t;
}

boolean Button(float x, float y, float w, float h) {
  boolean t = false;
  if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && !ggfdsakfjd && mousePressed) {
    ggfdsakfjd = true;
  } else if (mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h && ggfdsakfjd && !mousePressed) {
    ggfdsakfjd = false;
    t = true;
  }
  return t;
}

boolean antiButton(float x, float y, float w, float h) {
  boolean t = false;
  if (!(mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h) && !ggfdsakfjd && mousePressed) {
    ggfdsakfjd = true;
  } else if (!(mouseX >= x && mouseY >= y && mouseX <= x + w && mouseY <= y + h) && ggfdsakfjd && !mousePressed) {
    ggfdsakfjd = false;
    t = true;
  }
  return t;
}

boolean keyDetection(Character keyWanted) {
  boolean t = false;
  if (key == keyWanted && keyPressed && !P4essed) {
    P4essed = true;
  } else if (key == keyWanted && !keyPressed && P4essed) {
    P4essed = false; 
    t = true;
  }
  return t;
}

void rectG(float x, float y, float w, float h) {
  rect(floor(x) * grid, floor(y) * grid, w * grid, h * grid);
}

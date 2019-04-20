creator c = new creator();
String[] s = new String[1000];

void scenes () {
  if (scene == 0) {
    background(0);
    textSize(20);
    fill(255);
    text("Shape Generator (Processing Only)", 300, 50);
    if (Button("Settings", 250, 100, 100, 50, 22)) {
      scene = 1;
    }
    if (Button("Start", 250, 200, 100, 50, 22)) {
      scene = 2;
      rectanglex  = new float[1000];
      rectangley  = new float[1000];
      rectanglesx = new float[1000];
      rectanglesy = new float[1000];
      Circlex     = new float[1000];
      Circley     = new float[1000];
      Circler     = new float[1000];
      typing = new type(50, 230, 350, 50, "Shape");
    }
  } else if (scene == 1) {
    if (Button("Resizable: " + isResizable, 50, 50, 100, 50, 15)) {
      if (isResizable) {
        isResizable = false;
      } else {
        isResizable = true;
      }
    }
    if (Button("Decrease Grid Size", 50, 110, 100, 50, 15)) {
      grid -= 5;
    }
    if (Button("Increase Gird Size", 155, 110, 100, 50, 15)) {
      grid += 5;
    }
    textSize(15);
    text("Grid Size: "+grid, 260, 110, 100, 50);
    if (Button("Back", width - 110, height - 60, 100, 50, 22)) {
      scene = 0;
    }
  } else if (scene == 2 && isResizable) {
    if (!inMenu) {
      background(255);
      c.user();
      c.render();
      if (keyDetection('m') || keyDetection('M')) {
        inMenu = true;
      }
    } else if (inMenu) {
      c.render();
      fill(0, 0, 0, 100);
      rect(0, 0, 600, 600);
      if (Button("Rectangle", 50, 50, 120, 50, 22)) {
        c.Type = 0;
      }
      if (Button("Circle", 50, 110, 120, 50, 22)) {
        c.Type = 1;
      }
      if (Button("Show Grid: " + c.showGrid, 50, 170, 120, 50, 15)) {
        if (c.showGrid) {
          c.showGrid = false;
        } else if (!c.showGrid) {
          c.showGrid = true;
        }
      }
      if (Button("Generate", width - 110, height - 60, 100, 50, 22)) {
        scene = 3;
        inMenu = false;
      }
      typing.isTyping();
      typing.render();
      typing.typing();
      if (keyDetection('m') || keyDetection('M')) {
        inMenu = false;
      }
    }
  } else if (scene == 3 && isResizable) {
    s = new String[c.ClickedNR + c.ClickedNC + 3];
    s[0] = ("void Shape(float x, float y, float widthb, float heightb) {");
    s[1] = ("  float w = widthb / 4, h = heightb / 4;");
    for (int i = 1; i <= c.ClickedNR; i++) {
      s[i+1] = ("  rect(x + ("+floor(rectanglex[i]*grid)+") * w, y + ("+floor(rectangley[i]*grid)+") * h, w * "+floor(rectanglesx[i]*grid)+", h * "+floor(rectanglesy[i]*grid)+");");
    }
    for (int i = 1; i <= c.ClickedNC; i++) {
      s[i+c.ClickedNR+1] = ("  ellipse(x + ("+floor(Circlex[i]*grid)+") * w, y + ("+floor(Circley[i]*grid)+") * h, w * "+floor(Circler[i]*grid)+", h * "+floor(Circler[i]*grid)+");");
    }
    s[c.ClickedNC+c.ClickedNR+2] = ("}");
    saveStrings(typing.t+"_"+year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".txt", s);
    scene = 0;
    inMenu = true;
  }
}

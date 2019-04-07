creator c = new creator();

void scenes () {
  if (scene == 0) {
    background(0);
    textSize(50);
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
      if (Button("Rectangle", 50, 50, 120, 50, 22)){
        c.Type = 0;
      }
      if (Button("Circle", 50, 110, 120, 50, 22)){
        c.Type = 1;
      }
      if (Button("Generate", width - 110, height - 60, 100, 50, 22)) {
        scene = 3;
        inMenu = false;
      }
      if (keyDetection('m') || keyDetection('M')) {
        inMenu = false;
      }
    }
  } else if (scene == 3 && isResizable) {
    println("void Shape(float x, float y, float widthb, float heightb) {");
    println("  float w = widthb / 4, h = heightb / 4;");
    for (int i = 1; i <= c.ClickedNR; i++) {
      println("  rect(x + ("+floor(rectanglex[i]*grid)+") * w, y + ("+floor(rectangley[i]*grid)+") * h, w * "+floor(rectanglesx[i]*grid)+", h * "+floor(rectanglesy[i]*grid)+");");
    }
    for (int i = 1; i <= c.ClickedNC; i++) {
      println("  ellipse(x + ("+floor(Circlex[i]*grid)+") * w, y + ("+floor(Circley[i]*grid)+") * h, w * "+floor(Circler[i]*grid)+", h * "+floor(Circler[i]*grid)+");");
    }
    println("}");
    scene = 0;
    inMenu = true;
  }
}

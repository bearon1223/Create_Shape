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
    }
  } else if (scene == 1) {
    if (Button("Resizable: " + isResizable, 50, 50, 100, 50, 15)) {
      if (isResizable) {
        isResizable = false;
      } else {
        isResizable = true;
      }
    }
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
      if (Button("Generate", width - 110, height - 60, 100, 50, 22)) {
        scene = 3;
        inMenu = false;
      }
      if (keyDetection('m') || keyDetection('M')) {
        inMenu = false;
      }
    }
  } else if (scene == 3 && isResizable) {
    println("void Shape(float x, float y, float width, float height) {");
    println("  float w = width / 4, h = height / 4;");
    for (int i = 1; i <= c.ClickedNR; i++) {
      println("  rect((x + "+floor(rectanglex[i]*grid)+") * w,(y + "+floor(rectangley[i]*grid)+") * h,w * "+floor(rectanglesx[i]*grid)+",h * "+floor(rectanglesy[i]*grid)+");");
    }
    println("}");
    scene = 0;
  }
}

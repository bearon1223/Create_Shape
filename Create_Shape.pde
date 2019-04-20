float scene = 0, grid = 15;
Boolean isResizable = true, inMenu = true;
PImage icon;
type typing = new type(50, 230, 350, 50, "Shape");

void setup() {
  icon = loadImage("icon.jpg");
  size(600, 600);
  surface.setTitle("Shape Design");
  surface.setIcon(icon);
}

void draw() {
  textAlign(CENTER, CENTER);
  background(255);
  scenes();
}

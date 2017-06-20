Mover mover;
Spring spring;

void setup() {
  size(800,600);
  mover = new Mover(width/2, 400);
  spring = new Spring(width/2, 0, 400);
}

void draw() {
  background(220);
  PVector gravity = new PVector(0,0.2);
  mover.applyForce(gravity);
  spring.connect(mover);
  mover.update();
  mover.display();
  spring.display();
  spring.displayLine(mover);
  mover.drag(mouseX, mouseY);
}

void mousePressed() {
  mover.clicked(mouseX, mouseY);
}

void mouseReleased() {
  mover.stopDragging();
}

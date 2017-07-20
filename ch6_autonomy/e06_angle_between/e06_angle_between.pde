void setup( ) {
  size(600, 400);
}

void draw( ) {
  background(255);

  PVector mouseLoc = new PVector(mouseX, mouseY);
  PVector centerLoc = new PVector(width/2, height/2);

  PVector v = PVector.sub(mouseLoc, centerLoc);
  v.normalize();
  v.mult(75);

  PVector xAxis = new PVector(75, 0);

  drawVector(v, centerLoc, 1.0);
  drawVector(xAxis, centerLoc, 1.0);

  float angle = PVector.angleBetween(v, xAxis);

  fill(0);
  text(int(degrees(angle)) + " degrees\n" + angle + " radians", 10, 160);
}

void drawVector(PVector v, PVector pos, float scayl) {
  pushMatrix();
  translate(pos.x, pos.y);
  stroke(0);
  strokeWeight(2);
  rotate(v.heading2D());
  float len = v.mag()*scayl;
  line(0, 0, len, 0);
  popMatrix();
}

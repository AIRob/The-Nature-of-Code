Vehicle v;
PVector target;

void setup() {
  size(800, 600);
  v = new Vehicle(width/2, height/2);
  // target = new PVector(random(width), random(height));
  target = new PVector();
}

void draw() {
  background(255);
  target.set(mouseX, mouseY);
  v.update();
  v.seek(target);
  // v.flee(target);
  v.display();

  noStroke();
  fill(255, 0, 0);
  ellipse(target.x, target.y, 16, 16);
}

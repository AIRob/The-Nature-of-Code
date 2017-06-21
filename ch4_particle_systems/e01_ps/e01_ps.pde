Particle p;

void setup() {
  size(640, 360);
  p = new Particle(new PVector(width/2, 10));
}

void draw() {
  background(255);
  PVector gravity = new PVector(0, 0.05);
  p.applyForce(gravity);
  p.run();

  if (p.isDead()) {
    background(255, 0, 0);
  }
}

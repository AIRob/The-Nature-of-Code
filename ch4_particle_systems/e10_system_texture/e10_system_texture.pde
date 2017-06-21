ParticleSystem ps;
Repeller repeller;

void setup() {
  size(640, 360, P2D);
  ps = new ParticleSystem(new PVector(width/2, height-50));
  repeller = new Repeller(new PVector(width/2-20, height/2));
}

void draw() {
  blendMode(ADD);
  background(0);
  ps.addParticle();
  PVector gravity = new PVector(0, -0.1);
  ps.applyForce(gravity);
  ps.applyRepeller(repeller);
  ps.run();
  repeller.display();
}

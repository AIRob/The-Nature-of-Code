ArrayList<ParticleSystem> systems;

void setup() {
  size(640, 360);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  Iterator<ParticleSystem> it = systems.iterator();
  while (it.hasNext()) {
    ParticleSystem ps = it.next();
    ps.addParticle();
    ps.run();
    PVector gravity = new PVector(0, 0.1);
    PVector wind = new PVector(0.1, 0);
    ps.applyForce(gravity);
    ps.applyForce(wind);
  }
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}

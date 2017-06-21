ArrayList<ParticleSystem> systems;

void setup() {
  size(600, 200);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  Iterator<ParticleSystem> it = systems.iterator();
  while (it.hasNext()) {
    ParticleSystem ps = it.next();
    ps.addParticle();
    ps.run();
    if (ps.isDead()) {
      it.remove();
    }
  }
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}

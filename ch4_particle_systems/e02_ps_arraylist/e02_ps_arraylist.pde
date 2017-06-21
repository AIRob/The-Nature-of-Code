ArrayList<Particle> particles;

void setup() {
  size(640, 360);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  particles.add(new Particle(new PVector(width/2, 50)));

  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
  }

}

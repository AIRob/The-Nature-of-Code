import java.util.Iterator;
ArrayList<Particle> particles;

void setup() {
  size(640, 360);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  particles.add(new Particle(new PVector(width/2, 50)));

  // Using an iterator handles adding/removing object while iterating.
  Iterator<Particle> it = particles.iterator();

  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}

import java.util.Iterator;
ArrayList<Particle> particles;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector location;
  PVector time;
  float maxSpeed;

  ParticleSystem(PVector loc) {
    location = loc.get();
    time = new PVector(0, 100);
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(location));
  }

  void run() {
    float x = map(noise(time.x), 0, 1, 0, width);
    float y = map(noise(time.y), 0, 1, 0, height);
    location.set(x, y);
    time.set(time.x += 0.003, time.y += 0.003);

    Iterator<Particle> it = particles.iterator();

    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}

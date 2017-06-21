import java.util.Iterator;
ArrayList<Particle> particles;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float maxParticles;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    maxParticles = 500;
  }

  void addParticle() {
    particles.add(new Particle(origin));
    maxParticles -= 1;
  }

  void run() {
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

  boolean isDead() {
    if (particles.size() >= maxParticles) {
      return true;
    } else {
      return false;
    }
  }
}

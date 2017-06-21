import java.util.Iterator;
ArrayList<Particle> particles;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    float r = random(1);
    // 50% chance
    if (r < 0.5) {
      particles.add(new Particle(origin));
    } else {
      particles.add(new Confetti(origin));
    }
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
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
}

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
    particles.add(new Particle(origin));
  }

  void setLocation(PVector location) {
    origin = location.get();
  }

  void applyForce(PVector f) {
    PVector force = f.get();
    force.mult(-1);
    force.limit(0.09);

    Iterator<Particle> it = particles.iterator();

    while (it.hasNext()) {
      Particle p = it.next();
      p.applyForce(force);
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

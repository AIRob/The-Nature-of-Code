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

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void applyRepeller(Repeller r) {
    for (Particle p : particles) {
      PVector force = r.repel(p);
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

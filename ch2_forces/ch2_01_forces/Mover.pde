class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  // The ammount of matter in an object. We will visualize this as size but
  // note that size does not always indicate mass (e.g. metal ball vs. balloon).
  float mass;

  Mover() {
    location = new PVector(30, 30);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1; // made up
  }

  // Move the Mover
  void update() {
    // Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);

    // We need to clear acceleration each frame, it has no memory (in contrast
    // to location), instead it is calculated based on the environmental forces
    // currently present.
    acceleration.mult(0);
  }

  // Draw the Mover
  void display() {
    stroke(255);
    fill(0);
    // Scale size according to mass
    ellipse(location.x, location.y, mass * 16, mass * 16);
  }

  // Apply a force to the Mover
  void applyForce(PVector force) {
    // Wrong! - Forces override each other
    // acceleration = force;

    // We need to clone the force so we don't mutate it
    // PVector f = force.get();
    // force.div(mass);

    // An alternative way to write the above using the static method:
    PVector f = PVector.div(force, mass);

    // Right: Force accumulation
    acceleration.add(f);
  }

  // Bounce at edges
  void checkEdges() {
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = -velocity.x;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = -velocity.y;
    }
  }
}

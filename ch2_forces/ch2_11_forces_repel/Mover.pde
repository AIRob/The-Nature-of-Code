class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  // The ammount of matter in an object. We will visualize this as size but
  // note that size does not always indicate mass (e.g. metal ball vs. balloon).
  float mass;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
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
    noStroke();
    fill(0);
    // Scale size according to mass
    ellipse(location.x, location.y, mass * 16, mass * 16);

    // Visualize x,y origin
    fill(color(#F100FF));
    ellipse(location.x, location.y, 1, 1);
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

  // Calculate an attraction force to another Mover
  PVector attract(Mover m) {
    // Vector pointing from self to other Mover
    PVector force = PVector.sub(location, m.location);

    // Distance (magnitude)
    float distance = force.mag();

    // Constrain the distance so that we never consider the Mover less than
    // 5 pixels or more than 25 pixels away from the other Mover.
    //
    // This prevents dividing by distances that would be too strong or weak.
    distance = constrain(distance, 5.0, 25.0);

    // Normalize to unit vector for direction
    force.normalize();

    // Strength
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }

  // Calculate an repel force to another Mover
  PVector repel(Mover m) {
    // Vector pointing from self to other Mover
    PVector force = PVector.sub(location, m.location);

    // Distance (magnitude)
    float distance = force.mag();

    // Constrain the distance so that we never consider the Mover less than
    // 5 pixels or more than 25 pixels away from the other Mover.
    //
    // This prevents dividing by distances that would be too strong or weak.
    distance = constrain(distance, 5.0, 25.0);

    // Normalize to unit vector for direction
    force.normalize();

    // Strength
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(-strength);

    return force;
  }

  // Bounce at edges
  void checkEdges() {
    float edge = (mass * 16) / 2;
    if ((location.x + edge >= width) || (location.x - edge <= 0)) {
      velocity.x = -velocity.x;
    }
    if ((location.y + edge >= height) || (location.y - edge <= 0)) {
      velocity.y = -velocity.y;
    }
  }
}

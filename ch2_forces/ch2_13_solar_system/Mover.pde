class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  // Move the Mover
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Draw the Mover
  void display() {
    noStroke();
    fill(0, 80);
    ellipse(location.x, location.y, mass * 10, mass * 10);
  }

  // Apply a force to the Mover
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
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
}

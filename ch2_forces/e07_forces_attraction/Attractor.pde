class Attractor {
  PVector location;
  float mass;
  float G;

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 0.4;
  }

  PVector attract(Mover m) {
    // Vector pointing from Mover to Attractor
    PVector force = PVector.sub(location, m.location);

    // Distance (magnitude)
    float distance = force.mag();

    // Constrain the distance so that we never consider the Mover less than
    // 5 pixels or more than 25 pixels away from the attractor.
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

  void display() {
    stroke(0);
    fill(175, 200);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}

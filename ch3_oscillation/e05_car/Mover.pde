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
    velocity.limit(10);
    acceleration.mult(0);
  }

  // Draw the Mover
  void display() {
    // Solve for angle using arctangent (inverse tangent).
    // float angle = atan(velocity.y/velocity.x);

    // Use atan2() to account for all possible directions (-/+)
    // float angle = atan2(velocity.y, velocity.x);

    // PVector can already do this for us
    float angle = velocity.heading();

    noStroke();
    fill(0);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, 30, 10);
    rect(-8, 0, 5, 20);
    rect(8, 0, 5, 20);
    popMatrix();
  }

  // Apply a force to the Mover
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
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

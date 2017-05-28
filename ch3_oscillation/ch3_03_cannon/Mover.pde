class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.001;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  // Move the Mover
  void update() {
    // Regular motion
    velocity.add(acceleration);
    location.add(velocity);

    // Angular motion
    aAcceleration = acceleration.x / 10.0;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;

    acceleration.mult(0);
  }

  // Draw the Mover
  void display() {
    stroke(255);
    // noStroke();
    fill(100);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, mass*10, mass*10);
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

class Spaceship {
  // All of our regular motion stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  ParticleSystem thruster;
  float size;

  // Variable for heading
  float heading;

  Spaceship() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    thruster = new ParticleSystem(location);
    size = 16;
    heading = 0;
  }

  void go() {
    update();
    display();
    checkEdges();
  }

  // Move the Spaceship
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
    acceleration.mult(0);
    thruster.addParticle();
    thruster.applyForce(velocity);
  }

  // Draw the Spaceship
  void display() {
    // Settings
    noFill();
    stroke(255);
    strokeWeight(2);

    // Position
    pushMatrix();
    translate(location.x, location.y);
    rotate(heading);

    // Triangle
    beginShape();
    vertex(-size, size);
    vertex(0, -size);
    vertex(size, size);
    endShape(CLOSE);

    // Thruster
    thruster.setLocation(new PVector(0, size + 5));
    thruster.run();

    popMatrix();
  }

  // Apply a force to the Spaceship
  void applyForce(PVector force) {
    PVector f = force.get();
    acceleration.add(f);
  }

  void turn(float a) {
    heading += a;
  }

  void thrust() {
    // Offset the angle since we drew the ship vertically
    float angle = heading - PI/2;
    // Polar to cartesian for force vector!
    float x = cos(angle);
    float y = sin(angle);
    PVector force = new PVector(x, y);
    force.mult(0.1);
    applyForce(force);
  }

  // Wrap-around at edges
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}

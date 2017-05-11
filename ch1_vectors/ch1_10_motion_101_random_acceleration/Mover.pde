class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2,2), random(-2,2));
    topspeed = 10;
  }

  // Move the Mover
  void update() {
    acceleration = PVector.random2D();

    // Because the random vector is normalized (a unit-vector), we can scale it:
    // Scaling the acceleration to a constant value
    // acceleration.mult(0.1);
    // Scaling the acceleration to a random value
    // acceleration.mult(random(2));

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  // Draw the Mover
  void display() {
    stroke(255);
    fill(0);
    ellipse(location.x, location.y, 16, 16);
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

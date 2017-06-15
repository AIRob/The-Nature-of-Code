class Mover {
  AVector location;
  AVector velocity;
  AVector acceleration;
  float topspeed;

  Mover() {
    location = new AVector(random(width), random(height));
    velocity = new AVector(random(-2,2), random(-2,2));
    // Acceleration accumulates each frame, hence the small values
    acceleration = new AVector(-0.001, 0.01);
    topspeed = 10;
  }

  // Move the Mover
  void update() {
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

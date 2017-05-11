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
    // 1. Calculate a vector that points from the object to the target (mouse)
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);

    // 2. Normalize the vector (reduce its length to 1)
    dir.normalize();

    // 3. Scale that vector to an appropriate value (by multiplying it by some value)
    dir.mult(0.5);

    // 4. Assign that vector to acceleration
    acceleration = dir;

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

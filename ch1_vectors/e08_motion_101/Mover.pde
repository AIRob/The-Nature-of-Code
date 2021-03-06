class Mover {
  PVector location;
  PVector velocity;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
  }

  // Move the Mover
  void update() {
    location.add(velocity);
  }

  // Draw the Mover
  void display() {
    stroke(255);
    fill(0);
    ellipse(location.x, location.y, 16,16);
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

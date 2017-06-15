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

    // 2. Store the distance from the object to the mouse
    float distance = dir.mag();

    // 3. Normalize the vector (reduce its length to 1)
    dir.normalize();

    // 4a. Scale that vector to an appropriate value (by multiplying it by some value)
    // dir.mult(0.5);

    // 4b. Scale the vector in inverse proportion to the distance from the mouse
    // (the acceleration should decrease the closer the object is to the mouse)

    // If the object is further away from the mouse the force should be stronger (more).
    // If the object is closer to the mouse the force should be weaker (less).

    // We know how far away the object is from the mouse (distance).

    // if distance is big, higher value for mult
    // if distance is small, lower value for mult
    // println(distance / (width * height));
    dir.mult(distance);
    // dir.limit();

    // dir.mult(map(distance, 0, width, 0, 10));

    // Faster when closer
    // dir.mult(distance);
    // dir.limit(2);

    // println(distance);

    // Faster when farther
    // dir.div(map(distance, 0, width/2, 0, 1));
    // dir.div(distance/100);
    // dir.limit(2);

    // 5. Assign that vector to acceleration
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

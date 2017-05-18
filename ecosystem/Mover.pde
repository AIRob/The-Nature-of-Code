class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  // The ammount of matter in an object. We will visualize this as size but
  // note that size does not always indicate mass (e.g. metal ball vs. balloon).
  float mass;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  // Move the Mover
  void update() {
    // Made up forces
    PVector force;

    // Fly!
    if (mass < 3) {
      PVector mouse = new PVector(mouseX, mouseY);
      force = PVector.sub(mouse, location);
      force.normalize();
      force.mult(0.08);
    // Bunny!
    } else if (mass < 4.5) {
      force = new PVector(0.01, 0.05);
    // Snake!
    } else {
      force = new PVector(random(-0.05, 0.05), -0.009);
    }
    applyForce(force);

    // Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);

    // We need to clear acceleration each frame, it has no memory (in contrast
    // to location), instead it is calculated based on the environmental forces
    // currently present.
    acceleration.mult(0);
  }

  // Draw the Mover
  void display() {
    float size;

    // Fly!
    if (mass < 3) {
      noStroke();
      fill(0);
      size = mass * 2;
      ellipse(location.x, location.y, size, size);
    // Bunny!
    } else if (mass < 4.5) {
      noStroke();
      fill(0);
      size = mass * 16;
      ellipse(location.x, location.y - (size/2), size-8, size-8);
      ellipse(location.x, location.y, size, size);
    // Snake!
    } else {
      stroke(0);
      strokeWeight(3);
      noFill();
      size = mass * 16;
      beginShape();
      curveVertex(location.x, location.y); // the first control point
      curveVertex(location.x + 40, location.y + 40); // is also the start point of curve
      curveVertex(location.x + 80, location.y + 60);
      curveVertex(location.x + 100, location.y + 100);
      curveVertex(location.x + 60, location.y + 120);
      curveVertex(location.x + 50, location.y + 150); // the last point of curve
      curveVertex(location.x + 50, location.y + 150); // is also the last control point
      endShape();
    }

    // Visualize x,y origin
    fill(color(#F100FF));
    ellipse(location.x, location.y, 1, 1);
  }

  // Apply a force to the Mover
  void applyForce(PVector force) {
    // We need to clone the force so we don't mutate it
    PVector f = PVector.div(force, mass);

    // Force accumulation
    acceleration.add(f);
  }

  // Calculate an attraction force to another Mover
  PVector attract(Mover m) {
    // Vector pointing from self to other Mover
    PVector force = PVector.sub(location, m.location);

    // Distance (magnitude)
    float distance = force.mag();

    // Constrain the distance so that we never consider the Mover less than
    // 5 pixels or more than 25 pixels away from the other Mover. This prevents
    // dividing by distances that would be too strong or weak
    distance = constrain(distance, 5.0, 25.0);

    // Normalize to unit vector for direction
    force.normalize();

    // Strength
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }

  // Bounce at edges
  void checkEdges() {
    float edge = (mass * 16) / 2;
    if ((location.x + edge >= width) || (location.x - edge <= 0)) {
      velocity.x = -velocity.x;
    }
    if ((location.y + edge >= height) || (location.y - edge <= 0)) {
      velocity.y = -velocity.y;
    }
  }
}

class Creature {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector time;
  float heading;
  float mass;
  float maxSpeed;
  float beat;

  Creature(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    time = new PVector(random(0, 100), random(100, 200));
    maxSpeed = 2;
    beat = 0;
  }

  void update() {
    float x = map(noise(time.x), 0, 1, -maxSpeed, maxSpeed);
    float y = map(noise(time.y), 0, 1, -maxSpeed, maxSpeed);
    acceleration = new PVector(x, y);
    beat = map(sin(acceleration.x + acceleration.y), 0, 1, mass, mass*2);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
    heading = velocity.heading();
    time.set(time.x += 0.001, time.y += 0.001);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(heading);
    ellipseMode(CENTER);
    noFill();
    float offset = mass/4;
    ellipse(-offset, -offset, beat, beat);
    ellipse(-offset, offset, beat, beat);
    ellipse(offset, -offset, beat, beat);
    ellipse(offset, offset, beat, beat);
    popMatrix();
  }

  void checkEdges() {
    if (location.x < 0) {
      location.x = width;
    } else if (location.x > width) {
      location.x = 0;
    }
    if (location.y < 0) {
      location.y = height;
    } else if (location.y > height) {
      location.y = 0;
    }
  }
}

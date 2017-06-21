class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float angle = 0;
  float aVelocity = 0.01;

  float lifespan;

  Particle(PVector l) {
    location = l.get();
    velocity = new PVector();
    acceleration = new PVector();
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    angle += 0.02;
    lifespan -= 2;
  }

  void display() {
    stroke(0, lifespan);
    fill(175, lifespan);
    // ellipse(location.x, location.y, 8, 8);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, 8, 8);
    popMatrix();
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}

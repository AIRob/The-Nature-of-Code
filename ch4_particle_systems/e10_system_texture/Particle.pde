class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PImage img;

  float lifespan;
  float mass;

  Particle(PVector l) {
    location = l.get();
    velocity = new PVector(random(-1, 1), 0);
    acceleration = new PVector();
    lifespan = 255;
    mass = 1;
    img = loadImage("texture.png");
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2;
  }

  void display() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, location.x, location.y, 16, 16);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
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

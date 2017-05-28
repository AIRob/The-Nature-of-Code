/**
 * Oscillation - Car
 *
 * Create a simulation of a vehicle that you can drive around the screen using
 * the arrow keys: left arrow accelerates the car to the left, right to the
 * right. The car should point in the direction in which it is currently moving.
 */

Mover m;

void setup() {
  size(800, 600);
  m = new Mover(1, random(width), random(height));
}

void draw() {
  background(255);

  PVector friction = m.velocity.get();
  friction.mult(-1);
  friction.normalize();
  friction.mult(0.03);

  m.applyForce(friction);
  m.update();
  m.display();
  m.checkEdges();
}

void keyPressed() {
  PVector force;
  if (key == CODED) {
    if (keyCode == UP) {
      force = new PVector(0, -0.1);
      m.applyForce(force);
    }
    else if (keyCode == DOWN) {
      force = new PVector(0, 0.1);
      m.applyForce(force);
    }
    else if (keyCode == LEFT) {
      force = new PVector(-0.1, 0);
      m.applyForce(force);
    }
    else if (keyCode == RIGHT) {
      force = new PVector(0.1, 0);
      m.applyForce(force);
    }
  }
}

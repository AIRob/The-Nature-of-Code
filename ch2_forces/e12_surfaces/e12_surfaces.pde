/**
 * Forces - Surfaces
 *
 * Simulate surfaces with different friction forces.
 */

Mover mover;
float G = 0.4; // 'universal gravitational constant'

void setup() {
  fullScreen();
  mover = new Mover(3, 20, (height/2) - 15);
}

void draw() {
  background(220);

  noStroke();
  fill(200);
  rect(0, height/2, width/3, height/2);
  fill(100);
  rect(width/3, height/2, width/3, height/2);
  fill(255);
  rect(width/3*2, height/2, width/3, height/2);

  // Friction!
  float coefficient;
  if (mover.location.x < width/3) {
    coefficient = 0.3;
  } else if (mover.location.x < width/3*2) {
    coefficient = 0.4;
  } else {
    coefficient = 0.0;
  }
  PVector friction = mover.velocity.get();
  friction.mult(-1);
  friction.normalize();
  friction.mult(coefficient);
  mover.applyForce(friction);

  mover.update();
  mover.display();
  mover.checkEdges();
}

void keyPressed() {
  PVector force;
  if (key == CODED) {
    if (keyCode == RIGHT) {
      force = new PVector(0.5, 0);
      mover.applyForce(force);
    } else if (keyCode == LEFT) {
      force = new PVector(-0.5, 0);
      mover.applyForce(force);
    } else if (keyCode == UP) {
      force = new PVector(0, -5);
      mover.applyForce(force);
    }
  }
}

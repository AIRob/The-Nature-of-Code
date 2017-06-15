/**
 * Motion 101 with acceleration:
 *
 * Trickle-down effect:
 *
 * acceleration = the rate of change of velocity
 * velocity = the rate of change of location
 *
 * 1. Add acceleration to velocity
 * 2. Add velocity to location
 * 3. Draw object at location
 */

Mover mover;

void setup() {
  background(255);
  fullScreen();
  mover = new Mover();
}

void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}

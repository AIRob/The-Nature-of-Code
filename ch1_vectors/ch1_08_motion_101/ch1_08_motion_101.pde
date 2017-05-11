/**
 * Motion 101:
 *
 * 1. Add velocity to location
 * 2. Draw object at location
 *
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

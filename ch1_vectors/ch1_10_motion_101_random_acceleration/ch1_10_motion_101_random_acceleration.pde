/**
 * Motion 101 with random acceleration
 *
 * Note: Acceleration does not merely refer to the speeding up or slowing down
 * of a moving object, but rather _any change in velocity in either magnitude or
 * direction_.
 *
 * In other words, acceleration describes both the speed and direction.
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

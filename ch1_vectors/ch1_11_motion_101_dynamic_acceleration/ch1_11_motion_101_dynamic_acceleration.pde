/**
 * Motion 101 with dynamic acceleration (towards the mouse)
 *
 * The PVector class has static versions of add(), sub(), mult(), and div().
 *
 * Translate the following pseudocode to code using static or non-static
 * functions where appropriate:
 *
 * - The PVector v equals (1,5).
 * - The PVector u equals v multiplied by 2.
 * - The PVector w equals v minus u.
 * - Divide the PVector w by 3.
 *
 * PVector v = new PVector(1, 5);
 * PVector u = PVector.mult(v, 2);
 * PVector w = PVector.sub(v, u);
 * w.div(3);
 *
 * -----------------------------------------------------------------------------
 *
 * Anytime we want to calculate a vector based on a rule or a formula, we need
 * to compute two things: magnitude and direction.
 *
 * Acceleration:
 * We know the acceleration vector should point from the object’s location
 * towards the mouse location. We can get a vector (dx,dy) by subtracting the
 * object’s location from the mouse’s location:
 *
 * ax = mouseX - l.x
 * ay = mouseY - l.y
 *
 */

Mover mover;

void setup() {
  background(255);
  // size(600, 400);
  fullScreen();
  mover = new Mover();
}

void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}

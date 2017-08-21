/**
 * Cellular Automata (Random)
 *
 * Generates a new random ruleset when the mouse is clicked.
 */

CA ca;

void setup() {
  size(800,200);
  background(255);
  ca = new CA();
}

void draw() {
  ca.display();
  ca.generate();
  // if (ca.finished()) {
  //   ca.generate();
  // }
}

void mousePressed() {
  ca.regenerate();
  ca.generate();
}

/**
 * Ecosystem simulation
 *
 * Step 1:
 *
 * Develop a set of rules for simulating the real-world behavior of a creature,
 * such as a nervous fly, swimming fish, hopping bunny, slithering snake, etc.
 * Can you control the object’s motion by only manipulating the acceleration?
 * Try to give the creature a personality through its behavior (rather than
 * through its visual design).
 */

Mover[] movers = new Mover[10];
float G = 0.4; // gravity

void setup() {
  fullScreen();
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 5), random(width), random(height));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

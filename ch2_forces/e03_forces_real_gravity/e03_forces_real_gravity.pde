/**
 * Forces - Real Gravity
 *
 * Q. Dropping 2 balls of different mass, which one hits the ground first?
 * A. They both hit the ground at the same time.
 *
 * Why is this?
 *
 * The force of gravity is calculated relative to an object’s mass. The bigger
 * the object, the stronger the force. So if the force is scaled according to
 * mass, it is canceled out when acceleration is divided by mass.
 *
 * -----------------------------------------------------------------------------
 *
 * Follow this process for modelling a real-world force:
 *
 * 1. Understand the concept behind the force.
 *
 * 2. Deconstruct the force's formula into 2 parts:
 *    - How do we compute the force's direction?
 *    - How do we compute the force's magnitude?
 *
 * 3. Translating that formula into Processing code that calculates a PVector to
 *    be sent through our Mover's applyForce() function.
 *
 * -----------------------------------------------------------------------------
 *
 * Aside - Understanding Formulae
 *
 * - Evaluate from right to left
 *
 * - Evaluate the right side, assign to the left side (same as code).
 *
 * - Are we talking about a vector or a scalar? (1, →Friction, v^)
 *
 * - When symbols are placed next to each other, they should be multiplied.
 */

Mover[] movers = new Mover[100];

void setup() {
  size(640,360);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), 0, 0);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    PVector wind = new PVector(0.01, 0);

    // Scaling graivity by mass to be more accurate
    float mass = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * mass);

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

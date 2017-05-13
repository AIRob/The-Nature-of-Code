/**
 * Forces
 *
 * **A force is a vector – that's why we just learned about vectors!**
 *
 * Formal definition of a force:
 *
 * > A force is a vector that causes an object with mass to accelerate.
 *
 * Newton's Laws of Motion:
 *
 * 1. An object at rest stays at rest and an object in motion stays in motion at
 *    a constant speed and direction unless acted upon by an unbalanced force.
 *
 *    No force is required to keep an object moving:
 *    - In the absence of any forces
 *    - If the forces that act on it cancel each other out, i.e. the net force
 *      adds up to zero. This is often referred to as _equilibrium_.
 *
 *    In Processing:
 *
 *    An object’s PVector velocity will remain constant if it is in a state of
 *    equilibrium.
 *
 * 2. Net force equals mass times acceleration.
 *
 *    Or: acceleration is equal to the _sum of all forces_ divided by mass.
 *
 *    Acceleration is directly proportional to force: the harder you are pushed,
 *    the faster you’ll move (accelerate):
 *
 *    →F = M × →A
 *
 *    Acceleration is inversely proportional to mass: the bigger you are, the
 *    slower you’ll move (accelerate):
 *
 *    →A = →F / M
 *
 *    In our pretend pixel world we can say all our objects have a mass of 1, so
 *    we can simplify the above to:
 *
 *    →A = →F
 *
 * 3. Forces always occur in pairs. The two forces are of equal strength, but in
 *    opposite directions.
 *
 *    In Processing:
 *
 *    If we calculate a PVector f that is a force of object A on object B, we
 *    must also apply the force—PVector.mult(f,-1);—that B exerts on object A.
 */

Mover m;

void setup() {
  size(640,360);
  m = new Mover();
}

void draw() {
  background(255);

  // Apply forces!
  PVector wind = new PVector(0.01, 0);
  PVector gravity = new PVector(0,0.1);
  m.applyForce(wind);
  m.applyForce(gravity);

  m.update();
  m.display();
  m.checkEdges();
}

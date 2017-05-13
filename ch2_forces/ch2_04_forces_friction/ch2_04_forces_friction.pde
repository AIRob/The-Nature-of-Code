/**
 * Forces - Friction
 *
 * →Friction = -1 * µ * N * v^
 *
 * Friction points in the opposite direction of velocity.
 *
 * We have to determine 2 things:
 *
 * 1. The direction of friction (it's the opposite of velocity).
 *
 * 2. The magnitude (strength) of friction.
 */

Mover[] movers = new Mover[10];

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

    // Scaling gravity by mass to be more accurate
    float mass = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * mass);

    // Friction:
    // 1. Coefficient (µ) – the strength of friction for a particular surface.
    float c = 0.01; // arbitrary

    // 2. Normal force – the force perpendicular to the object’s motion along a
    // surface (e.g. the road pushing back on a car).
    float normal = 1; // arbitrary

    // 3. Friction magnitude (strength) is coefficient * normal force
    float frictionMag = c * normal;

    // 4. Friction direction is opposite of velocity
    PVector friction = movers[i].velocity.get(); // clone
    friction.mult(-1); // opposite
    friction.normalize(); // unit vector

    // 5. Scale the unit vector and we have our force vector
    friction.mult(frictionMag);

    // 6. Apply our forces
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

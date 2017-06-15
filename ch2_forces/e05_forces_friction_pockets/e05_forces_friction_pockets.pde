/**
 * Forces - Friction Pockets (Exercise 2.4)
 *
 * Create pockets of friction in a Processing sketch so that objects only
 * experience friction when crossing over those pockets. What if you vary the
 * strength (friction coefficient) of each area? What if you make some pockets
 * feature the opposite of friction—i.e., when you enter a given pocket you
 * actually speed up instead of slowing down?
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
    // Wind
    PVector wind = new PVector(0.01, 0);

    // Gravity
    float mass = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * mass);

    // Friction
    float coefficient;
    PVector friction = movers[i].velocity.get();
    PVector location = movers[i].location.get();

    int pocketWidth = width / 3;

    if (location.x < pocketWidth) {
      coefficient = 0.01;
      friction.mult(-1);
    } else if (location.x < pocketWidth * 2) {
      coefficient = 0.05;
      friction.mult(3);
    } else {
      coefficient = 0.09;
      friction.mult(-1);
    }

    // friction.mult(-1);
    friction.normalize();
    friction.mult(coefficient);

    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

/**
 * Mover rotation
 *
 * Remember motion 101?
 * location = location + velocity
 * velocity = velocity + acceleration
 *
 * The same applies to angular motion:
 * angle = angle + angular velocity
 * angular velocity = angular velocity + angular acceleration
 */

Mover[] movers = new Mover[10];
Attractor a;

void setup() {
  size(640, 360);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 3), random(width), random(height));
  }

  a = new Attractor();
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    PVector f = a.attract(movers[i]);
    movers[i].applyForce(f);
    movers[i].update();
    movers[i].display();
  }

  a.display();
}

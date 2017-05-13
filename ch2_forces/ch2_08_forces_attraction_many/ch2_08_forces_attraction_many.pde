/**
 * Forces - Gravitational Attraction (Many)
 */

Mover[] movers = new Mover[10];
Attractor a;

void setup() {
  size(640,360);

  // Create Movers
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), i*50, -i);
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
    movers[i].checkEdges();
  }

  a.display();
}

/**
 * Forces - Gravitational Attraction (Pattern)
 */

Mover[] movers = new Mover[10];
Attractor[] attractors = new Attractor[10];

void setup() {
  background(255);
  fullScreen();
  // size(640,360);

  // Create Movers
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 1), random(width), random(height));
  }

  // Create Attractors
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor(random(1, 6), random(width), random(height));
  }
}

void draw() {
  // background(255);

  for (int i = 0; i < movers.length; i++) {
    PVector f = attractors[i].attract(movers[i]);
    movers[i].applyForce(f);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
    attractors[i].display();
  }
}

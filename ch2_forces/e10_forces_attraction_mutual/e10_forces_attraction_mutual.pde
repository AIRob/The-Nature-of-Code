/**
 * Forces - Gravitational Attraction (Mutual)
 *
 * Every object in a given system attracts every other object in that system
 * (except for itself)
 */

Mover[] movers = new Mover[10];
float G = 0.4; // 'universal gravitational constant'

void setup() {
  fullScreen();

  // Create Movers
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), random(width), random(height));
  }
}

void draw() {
  background(0);

  for (int i = 0; i < movers.length; i++) {
    // For every Mover, check every Mover
    for (int j = 0; j < movers.length; j++) {
      // Don't attract yourself
      if (i != j) {
        PVector f = movers[j].attract(movers[i]);
        movers[i].applyForce(f);
      }
    }
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

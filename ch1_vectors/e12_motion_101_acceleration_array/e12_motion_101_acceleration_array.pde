/**
 * Motion 101 multiple movers
 */

Mover mover;
Mover[] movers = new Mover[20];

void setup() {
  // size(600, 400);
  fullScreen();
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

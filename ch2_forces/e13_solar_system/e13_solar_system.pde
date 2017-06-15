/**
 * Forces - Solar System
 */

Mover[] movers = new Mover[8];
Attractor attractor;
float G = 0.1;

void setup() {
  fullScreen();

  for (int i = 0; i < movers.length; i++) {
    float interval = i+1*10;
    movers[i] = new Mover(i, interval, interval);
  }

  attractor = new Attractor();
}

void draw() {
  background(255);
  attractor.display();

  for (int i = 0; i < movers.length; i++) {
    PVector f = attractor.attract(movers[i]);
    movers[i].applyForce(f);
    movers[i].update();
    movers[i].display();
  }
}

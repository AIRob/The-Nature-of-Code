/**
 * Forces - Gravitational Attraction (Exercise 2.10)
 *
 * Create an example in which all of the Mover objects are attracted to the
 * mouse, but repel each other? Think about how you need to balance the relative
 * strength of the forces and how to most effectively use distance in your force
 * calculations.
 *
 * Steps:
 *
 * A) Attract mover objects to the mouse:
 *
 * 1. Create a vector that tracks the mouse position
 */

Mover[] movers = new Mover[10];
PVector mouse;
float G = 0.4; // 'universal gravitational constant'

void setup() {
  fullScreen();

  // Create Movers
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), random(width), random(height));
  }
}

void draw() {
  background(255);

  // Capture the mouse position
  mouse = new PVector(mouseX, mouseY);

  for (int i = 0; i < movers.length; i++) {

    // 1. Attract Movers to the mouse
    PVector attraction = PVector.sub(mouse, movers[i].location);
    float distance = attraction.mag();
    attraction.normalize();
    attraction.mult(0.05);
    movers[i].applyForce(attraction);

    // 2. Repel other Movers
    // For every Mover, check every Mover
    for (int j = 0; j < movers.length; j++) {
      // Don't repel yourself
      if (i != j) {
        PVector f = movers[j].repel(movers[i]);
        movers[i].applyForce(f);
      }
    }
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

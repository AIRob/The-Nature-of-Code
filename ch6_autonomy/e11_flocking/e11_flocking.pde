/**
 * Group Behaviors (Flocking)
 *
 * Flocking is an group animal behavior that is characteristic of many living
 * creatures, such as birds, fish, and insects.
 *
 * The three rules of flocking:
 *
 * 1. Separation (also known as “avoidance”): Steer to avoid colliding with
 *    your neighbors.
 *
 * 2. Alignment (also known as “copy”): Steer in the same direction as your
 *    neighbors.
 *
 * 3. Cohesion (also known as “center”): Steer towards the center of your
 *    neighbors (stay with the group).
 *
 * Note: This runs rather slowly when there are many boids because it's
 * O(N2) (Big O Notation N-Squared) - for every boid we have to check every
 * other boid. This could be optimized with "bin-lattice spatial subdivision"
 * (dividing the canvas into a grid and only checking boids in current area).
 *
 * 1,000 x 1,000 = 1,000,000 cycles.
 * 10,000 x 10,000 elements = 100,000,000 cycles.
 */

Flock flock;

void setup() {
  // size(640, 360);
  fullScreen();

  flock = new Flock();
  for (int i = 0; i < 100; i++) {
    flock.addBoid(new Boid(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(255);
  flock.run();
}

void mouseDragged() {
  flock.addBoid(new Boid(new PVector(mouseX, mouseY)));
}

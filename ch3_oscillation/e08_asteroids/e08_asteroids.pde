/**
 * Oscillation - Asteroids (Exercise 3.5)
 *
 * Simulate the spaceship in the game Asteroids:

 * - A spaceship (represented as a triangle) floats in two dimensional space.
 * - The left arrow key turns the spaceship counterclockwise
 * - The right arrow key turns the spaceship clockwise
 * - The z key applies a "thrust" force in the direction the spaceship is pointing
 */

Spaceship ship;

void setup() {
  size(800, 600);
  ship = new Spaceship();
}

void draw() {
  background(0);
  ship.update();
  ship.display();
  ship.checkEdges();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-0.03);
  } else if (keyCode == RIGHT) {
    ship.turn(0.03);
  } else if (key == 'z') {
    ship.thrust();
  }
}

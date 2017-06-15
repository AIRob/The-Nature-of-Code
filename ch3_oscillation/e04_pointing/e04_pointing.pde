/**
 * Oscillation - Pointing Velocity
 *
 * Trigonometry (trig) is the mathematics of triangles, specifically right
 * triangles.
 *
 * A basic understanding of trigonometry is essential if you want to calculate
 * an angle, figure out the distance between points, work with circles, arcs,
 * or lines.
 *
 * "sohcahtoa" is a mnemonic for the meaning of the trig functions:
 *
 * soh = sine = opposite/hypotenuse
 * cah = cosine = adjacent/hypotenuse
 * toa = tan = opposite/adjacent
 *
 * This is useful as it allows us to establish a relationship between the
 * components of a vector, as a vector can be thought of as a right triangle:
 *
 * vector = hypotenuse
 * components of vector (x and y) are the sides
 * angle = vectors direction (or 'heading')
 *
 * In other words, it gives us ways to work out the other parts of a vector.
 */

Mover m;

void setup() {
  size(800, 600);
  m = new Mover(1, random(width), random(height));
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  PVector force = PVector.sub(mouse, m.location);
  force.setMag(0.1);
  m.applyForce(force);
  m.update();
  m.display();
  m.checkEdges();
}

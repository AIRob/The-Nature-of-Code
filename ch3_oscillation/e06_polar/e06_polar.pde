/**
 * Oscillation - Polar to Cartesian Coordinates
 *
 * Any time we display a shape in Processing, we have to specify a pixel
 * location, a set of x and y coordinates. These coordinates are known as
 * Cartesian coordinates.
 *
 * Polar coordinates describes a point in space as an angle of rotation around
 * the origin and a radius from the origin.
 *
 * Cartesian coordinate: the x,y components of a vector
 * Polar coordinate: the magnitude (length) and direction (angle) of a vector
 */

float r = 75;
float theta = 0; // The Greek letter θ (theta) is often used to denote an angle.

void setup( ) {
  size(640, 360);
  background(255);
}

void draw( ) {
  background(255);

  float x = r * cos(theta);
  float y = r * sin(theta);

  stroke(0);
  fill(0);
  line(width/2, height/2, x+width/2, y+height/2);
  ellipse(x+width/2, y+height/2, 16, 16);

  // To move a shape along a circular path using Cartesian coordinates is not
  // so easy. With polar coordinates, on the other hand, it’s simple:
  // increment the angle!
  theta += 0.01;
}

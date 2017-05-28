/**
 * Oscillation - Simple Harmonic Motion - Spring
 *
 * Using the sine function, create a simulation of a weight (sometimes referred
 * to as a “bob”) that hangs from a spring from the top of the window. Use the
 * map() function to calculate the vertical location of the bob.
 */

float angle = 0;
float aVel = 0.09;

void setup( ) {
  size(500, 500);
}

void draw( ) {
  background(255);
  translate(width/2, 0);

  float y = map(cos(angle), -1, 1, 200, 250);

  line(0,0,0,y);
  ellipseMode(CENTER);
  ellipse(0,y,30,30);

  angle += aVel;
}

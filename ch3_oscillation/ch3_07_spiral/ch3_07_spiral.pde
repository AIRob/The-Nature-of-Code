/**
 * Oscillation - Spiral Pattern (Exercise 3.4)
 *
 * Using Example 3.4 as a basis, draw a spiral path. Start in the center and
 * move outwards. Note that this can be done by only changing one line of code
 * and adding one line of code!
 */

float r = 1;
float theta = 0;

void setup( ) {
  size(640, 360);
  background(255);
  smooth();
}

void draw( ) {
  float x = r * cos(theta);
  float y = r * sin(theta);

  noStroke();
  fill(0);
  ellipse(x+width/2, y+height/2, 16, 16);

  theta += 0.1;
  r += 0.5;
}

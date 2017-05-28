/**
 * Oscillation - Simple Harmonic Motion x and y
 */

float xAngle = 0;
float yAngle = 0;

void setup( ) {
  size(500, 500);
}

void draw( ) {
  background(255);
  stroke(0);
  fill(175);

  float xAmp = 250;
  float yAmp = 250;

  float x = xAmp * cos(xAngle);
  float y = yAmp * cos(yAngle);

  translate(width/2, height/2);
  line(0,0,x,y);
  ellipse(x,y,20,20);

  xAngle += 0.05;
  yAngle += 0.02;
}

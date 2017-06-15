//
// Paint splatter simulation
// =========================
//
// A simulation of paint splatter drawn as a collection of colored dots.
//
// 1) Use a normal distribution of random numbers to generate the locations of the dots.
// 2) Use a normal distribution of random numbers to generate a color palette.
//

import java.util.Random;

Random generator;

void setup() {
  size(640, 640);
  background(255);
  generator = new Random();
}

void draw() {
  float mean = 320;
  float sd = 60;

  // Location
  float gx = (float) generator.nextGaussian();
  float gy = (float) generator.nextGaussian();
  float x = sd * gx + mean;
  float y = sd * gy + mean;

  // Color
  float gr = (float) generator.nextGaussian();
  float gg = (float) generator.nextGaussian();
  float gb = (float) generator.nextGaussian();
  float r = sd * gr + 127;
  float g = sd * gg + 127;
  float b = sd * gb + 127;

  noStroke();
  fill(r,g,b);
  ellipse(x,y,6,6);
}

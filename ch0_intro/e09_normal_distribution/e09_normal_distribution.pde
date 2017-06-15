//
// Normal (Gaussian) distribution
// ==============================
//
// A distribution of values that cluster around an average (referred to as the “mean”)
// is known as a “normal” distribution. It is also called the Gaussian distribution.
//
// When you graph the distribution, you get a "bell curve".
//
// The curve is generated by a mathematical function that defines the probability of any
// given value occurring as a function of the mean (often written as μ, the Greek letter mu)
// and standard deviation (σ, the Greek letter sigma).
//
// Mean:
//
// mean (average) = sum / count
// (6 + 11 + 7) / 3 = 8
//
// Standard Deviation:
//
// low = values are tightly clustered around the mean
// high = values are more evenly spread out
//

import java.util.Random;

Random generator;

void setup() {
  size(640, 320);
  background(255);
  generator = new Random();
}

void draw() {
  // The nextGaussian() function returns a normal distribution of random numbers with the
  // following parameters: a mean of zero and a standard deviation of one.
  float num = (float) generator.nextGaussian();

  // A mean of 320 pixels (the center horizontal pixel in a window of width 640)
  float mean = 320;

  // A standard deviation of 60 pixels
  float sd = 60;

  // Multiply by the standard deviation and add the mean.
  float x = sd * num + mean;

  noStroke();
  fill(0,10);
  ellipse(x,160,16,16);
}
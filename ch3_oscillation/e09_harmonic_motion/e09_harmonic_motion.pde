/**
 * Oscillation - Simple Harmonic Motion
 *
 * The output of the sine function is a smooth curve alternating between –1
 * and 1. This type of a behavior is known as oscillation, a periodic movement
 * between two points.
 *
 * Plucking a guitar string, swinging a pendulum, bouncing on a pogo stick —
 * these are all examples of oscillating motion.
 *
 * Simple harmonic motion can be expressed as any location (in our case, the x
 * location) as a function of time, with the following two elements:
 *
 * - Amplitude: The distance from the center of motion to either extreme
 * - Period: The amount of time it takes for one complete cycle of motion
 *
 * Looking at a graph of sine we can see that the amplitude is 1 and the period
 * is TWO_PI; the output of sine never rises above 1 or below -1; and every
 * TWO_PI radians (or 360 degrees) the wave pattern repeats.
 */

void setup( ) {
  size(200, 480);
}

void draw( ) {
  background(255);
  stroke(0);
  fill(175);

  // Amplitude can be measured rather easily in pixels. In the case of a window
  // 200 pixels wide, we would oscillate from the center 100 pixels to the right
  // and 100 pixels to the left. Therefore:
  float amplitude = 100;

  // The real measure of time in Processing is in frames. The oscillating motion
  // should repeat every 30 frames, or 50 frames, or 1000 frames, etc.
  float period = 120;

  // Calculate x as a function of time:

  // 1. frameCount divided by period tells us how many cycles we’ve completed.
  float cycles = frameCount / period;

  // 2. By multiplying that number by TWO_PI, we get the result we want, since
  //    TWO_PI is the number of radians required for one cosine (or sine) to
  //    complete one cycle.
  float radians = TWO_PI * cycles;

  // 3. Whatever comes out of the cosine function we multiply by amplitude.
  //    We know that cosine will oscillate between -1 and 1. If we take that
  //    value and multiply it by amplitude then we’ll get the desired result:
  //    a value oscillating between -amplitude and amplitude.
  float x = amplitude * cos(radians);

  translate(width/2, height/2);
  line(0,0,x,0);
  ellipse(x,0,20,20);
}

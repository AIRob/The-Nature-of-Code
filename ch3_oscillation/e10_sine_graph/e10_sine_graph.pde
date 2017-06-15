/**
 * Oscillation - Sine Graph
 *
 * Waves have properties:
 *
 * - Amplitude - height of wave (diff between min/max)
 * - Period (Frequency) - the amount of time it takes to repeat 1 cycle
 *                        (smaller period = faster oscillation)
 */

float x = 0;
float angle = 0;

void setup( ) {
  size(500, 200);
  background(255);
  noStroke();
  fill(0);
}

void draw( ) {
  float amplitude = 100; // height/2

  // We could do this...
  // float period = 200; // frames
  // float cycles = frameCount/period; // ratio of current frame to period
  // float angle = TWO_PI*cycles; // full rotation of a circle = 1 cycle

  float y = amplitude * cos(angle); // 100..-100

  translate(0, height/2);
  ellipseMode(CENTER);
  ellipse(x, y, 4, 4);

  x += 1;

  // ...but really that just gives us an incrementing number, so we can simplify
  // it to just increasing the angle (= angular velocity)
  angle += 0.05;
}

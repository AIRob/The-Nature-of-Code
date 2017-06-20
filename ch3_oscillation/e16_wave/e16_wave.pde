/**
 * Waves
 *
 * When we oscillate a single circle up and down according to the sine function,
 * what we are doing is looking at a single point along the x-axis of a wave
 * pattern.
 *
 * Here, we’re going to encounter the same questions of amplitude (height of
 * pattern) and period. Instead of period referring to time, however, since
 * we’re looking at the full wave, we can talk about period as the width
 * (in pixels) of a full wave cycle.
 */

// Angular velocity
float angle = 0;
float angleVel = 0.2;
float amplitude = 100;

size(400,200);
background(255);

// Draw a point of the wave every 24 pixels
for (int x = 0; x <= width; x += 24) {
  // Calculate the y location according to amplitude and sine of the angle
  float y = amplitude*sin(angle);
  // Draw a circle at the (x,y) location
  ellipse(x,y+height/2,48,48);
  // Increment the angle according to angular velocity
  angle += angleVel;
}

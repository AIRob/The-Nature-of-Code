/**
 * Waves – animated wave
 *
 * The previous example is static. If you look at the wave, the righthand edge
 * doesn’t match the lefthand; where it ends in one cycle of draw() can’t be
 * where it starts in the next.
 *
 * Instead, what we need to do is have a variable dedicated entirely to
 * tracking what value of angle the wave should start with. This angle (which
 * we’ll call startAngle) increments with its own angular velocity.
 */

// Angular velocity
float startAngle = 0;
float angleVel = 0.5;

void setup() {
  size(400,200);
  stroke(0);
  strokeWeight(2);
  noFill();
}

void draw( ) {
  background(255);

  // In order to move the wave, we start at a different theta value each frame.
  startAngle += 0.02;
  float angle = startAngle;

  beginShape();

  // Draw a point of the wave every 5 pixels
  for (int x = 0; x <= width; x += 5) {
    // Calculate the y location according to amplitude and sine of the angle
    float y = map(sin(angle),-1,1,0,height);
    // With beginShape() and endShape(), you call vertex() to set all the vertices of your shape
    vertex(x,y);
    // Increment the angle according to angular velocity
    angle += angleVel;
  }

  endShape();
}

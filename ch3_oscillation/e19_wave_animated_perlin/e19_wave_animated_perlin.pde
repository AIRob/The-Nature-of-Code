/**
 * Waves – animated waves with Perlin noise
 *
 * Try using the Perlin noise function instead of sine or cosine with the
 * previous example.
 */

// Angular velocity
float startAngle = 0;
float angleVel = 0.7;

void setup() {
  size(400,200);
  stroke(0);
  strokeWeight(2);
  noFill();
}

void draw( ) {
  background(255);

  // In order to move the wave, we start at a different theta value each frame.
  startAngle += 0.03;
  float angle = startAngle;

  beginShape();

  // Draw a point of the wave every 5 pixels
  for (int x = 0; x <= width; x += 5) {
    // Calculate the y location according to amplitude and sine of the angle
    float y = map(noise(angle),-1,1,0,height);
    // With beginShape() and endShape(), you call vertex() to set all the vertices of your shape
    vertex(x,y);
    // Increment the angle according to angular velocity
    angle += angleVel;
  }

  endShape();
}

/**
 * Waves – static wave drawn as a continuous line
 */

// Angular velocity
float angle = 0;
float angleVel = 0.2;
float amplitude = 100;

// Drawing setup
size(400,200);
background(255);
stroke(0);
strokeWeight(2);
noFill();

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

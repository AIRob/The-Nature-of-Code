float angle = 0;
float aVelocity = 0;
float aAcceleration = 0.001;

void setup() {
  size(640, 480);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  aVelocity += aAcceleration;
  angle += aVelocity;
  constrain(angle, 0, 0.2);
  rotate(angle);
  line(-50, 0, 50, 0);
  ellipseMode(CENTER);
  ellipse(-50, 0, 10, 10);
  ellipse(50, 0, 10, 10);
  popMatrix();
}

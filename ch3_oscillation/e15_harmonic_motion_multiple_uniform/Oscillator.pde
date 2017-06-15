class Oscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;
  PVector acceleration;

  Oscillator(float i) {
    angle = new PVector(radians(i*TWO_PI), radians(i*TWO_PI));
    velocity = new PVector();
    amplitude = new PVector(i*20, i*20);
    acceleration = new PVector(i*0.0301, -i*0.09);
  }

  void update( ) {
    velocity.add(acceleration);
    velocity.limit(0.5);
    angle.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    float x = amplitude.x * sin(angle.x);
    float y = amplitude.y * sin(angle.y);
    noStroke();
    fill(255);
    pushMatrix();
    translate(width/2, height/2);
    ellipse(x,y,4,4);
    popMatrix();
  }
}

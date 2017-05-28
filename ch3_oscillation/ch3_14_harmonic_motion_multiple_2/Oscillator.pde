class Oscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;

  Oscillator() {
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05), random(-0.05,0.05));
    amplitude = new PVector(random(width/2), random(height/2));
  }

  void update( ) {
    angle.add(velocity);
  }

  void display() {
    float x = amplitude.x * sin(angle.x);
    float y = amplitude.y * sin(angle.y);

    stroke(0);
    fill(175);
    pushMatrix();
    translate(width/2, height/2);
    line(0,0,x,y);
    ellipse(x,y,20,20);
    popMatrix();
  }
}

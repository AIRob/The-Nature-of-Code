class Oscillator {
  PVector location;
  float xangle = 0;
  float yangle = 0;
  float xamp, yamp;
  float xinc, yinc;

  Oscillator() {
    location = new PVector(width/2, height/2);
    xamp = random(float(width/2));
    yamp = random(float(height/2));
    xinc = random(0, 0.1);
    yinc = random(0, 0.1);
  }

  void update( ) {
    location.x = xamp * cos(xangle);
    location.y = yamp * cos(yangle);
    xangle += xinc;
    yangle += yinc;
  }

  void display() {
    stroke(0);
    fill(175);
    pushMatrix();
    translate(width/2, height/2);
    line(0,0,location.x,location.y);
    ellipse(location.x,location.y,20,20);
    popMatrix();
  }
}

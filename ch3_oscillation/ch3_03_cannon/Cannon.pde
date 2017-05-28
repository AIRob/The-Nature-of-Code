class Cannon {
  float x, y, angle;

  Cannon(float _x, float _y, float a) {
    x = _x;
    y = _y;
    angle = a;
  }

  void display( ) {
    pushMatrix();
    fill(0);
    noStroke();
    rectMode(CENTER);
    translate(x, y);
    rotate(-radians(angle));
    rect(0, 0, 50, 20);
    popMatrix();
  }

  PVector shoot( ) {
    PVector force = new PVector(0.5, -0.5);
    return force;
  }
}

class Wave {
  PVector location;
  float _width;
  float amplitude;
  float angle;
  float startAngle = 0;
  float angleVel = 0.5;

  Wave(float x, float y, float w, float a) {
    location = new PVector(x, y);
    _width = w;
    amplitude = a;
  }

  void update() {
    startAngle += 0.02;
    angle = startAngle;
  }

  void display() {
    pushMatrix();
    translate(location.x,location.y);
    stroke(0);
    fill(127,50);
    beginShape();
    for (int x = 0; x <= _width; x += 5) {
      float y = map(sin(angle),-1,1,0,amplitude);
      curveVertex(x,y);
      angle += angleVel;
    }
    endShape();
    popMatrix();
  }
}

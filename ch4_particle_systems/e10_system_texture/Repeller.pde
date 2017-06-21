class Repeller {
  PVector location;
  float r = 10;
  float strength = 100;

  Repeller(PVector l) {
    location = l.get();
  }

  PVector repel(Particle p) {
    PVector dir = PVector.sub(location, p.location);
    float distance = dir.mag();
    distance = constrain(distance, 5, 100);
    dir.normalize();
    float force = -1 * strength / (distance * distance);
    dir.mult(force);
    return dir;
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, r*2, r*2);
  }
}

class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  // We need to constrain desired velocity so that the vehicle can't just
  // 'teleport' to its target location.
  float maxspeed;

  // 'Steering' ability (handling)
  float maxforce;

  // Size
  float r;

  Vehicle(PVector l, float ms, float mf) {
    location = l.get();
    velocity = new PVector();
    acceleration = new PVector(0.5, 1);
    maxspeed = ms;
    maxforce = mf;
    r = 3;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    // Vehicle is a triangle pointing in the direction of velocity;
    // since it is drawn pointing up, we rotate it an additional 90 degrees.
    float theta = velocity.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }

  void follow(Path p) {
    // Step 1: Predict the vehicle’s future location:
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(50); // look 50px ahead
    PVector predictLoc = PVector.add(location, predict);

    // Step 2: Find the normal point along the path:
    PVector a = p.start;
    PVector b = p.end;
    PVector normalPoint = getNormalPoint(predictLoc, a, b);

    // Step 3: Move a little further along the path and set a target:
    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(10);
    PVector target = PVector.add(normalPoint, dir);

    // Step 4: If we are off the path, seek that target in order to stay on the path:
    float distance = PVector.dist(predictLoc, normalPoint);
    if (distance > p.radius) {
      seek(target);
    }
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location); // vector pointing from location to target
    desired.normalize(); // unit vector (direction)
    desired.mult(maxspeed); // constrain
    PVector steer = PVector.sub(desired, velocity); // Reynolds's steering formula
    steer.limit(maxforce); // how easy does the vehicle turn?
    applyForce(steer);
  }

  void flee(PVector target) {
    PVector desired = PVector.sub(target, location); // vector from location to target
    desired.normalize(); // unit vector (direction)
    desired.mult(-maxspeed); // constrain
    PVector steer = PVector.sub(desired, velocity); // Reynolds's steering formula
    steer.limit(maxforce); // how easy does the vehicle turn?
    applyForce(steer);
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  // Wraparound
  void borders(Path p) {
    if (location.x > p.end.x + r) {
      location.x = p.start.x - r;
      location.y = p.start.y + (location.y-p.end.y);
    }
  }

  PVector getNormalPoint(PVector predictLoc, PVector a, PVector b) {
    // PVector that points from a to p:
    PVector ap = PVector.sub(predictLoc, a);

    // PVector that points from a to b:
    PVector ab = PVector.sub(b, a);

    // Using the dot product for scalar projection:
    ab.normalize();
    ab.mult(ap.dot(ab));

    // Finding the normal point along the line segment:
    PVector normalPoint = PVector.add(a, ab);

    return normalPoint;
  }
}

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

    // Step 2: Find the normal point for all the line segments of the path:
    PVector normal = null;
    PVector target = null;
    float worldRecord = 1000000;

    // Loop through all the points of the path
    for (int i = 0; i < p.points.size() - 1; i++) {

      // Look at a line segment
      PVector a = p.points.get(i);
      PVector b = p.points.get(i+1);

      // Get the normal point to that line
      PVector normalPoint = getNormalPoint(predictLoc, a, b);

      // Make sure the normal point is actually between points a and b
      // Note: This only works because we know our path goes from left to right
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        // Use the end point of the segment as our normal point if we can’t find one
        normalPoint = b.get();
      }

      // How far away are we from the path?
      float distance = PVector.dist(predictLoc, normalPoint);

      // Did we find the closest line segment?
      if (distance < worldRecord) {
        worldRecord = distance;
        // If so the target we want to steer towards is the normal
        normal = normalPoint.get();

        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        PVector dir = PVector.sub(b, a);
        dir.normalize();
        dir.mult(10);
        target = PVector.add(normalPoint, dir);
      }
    }

    // Step 4: If we are off the path, seek that target in order to stay on the path:
    if (worldRecord > p.radius) {
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
    if (location.x > p.getEnd().x + r) {
      location.x = p.getStart().x - r;
      location.y = p.getStart().y + (location.y-p.getEnd().y);
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

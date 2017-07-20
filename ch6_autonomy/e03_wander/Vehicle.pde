/**
 * Steering: Wander
 *
 * “Wandering is a type of random steering which has some long term order: the
 * steering direction on one frame is related to the steering direction on the
 * next frame. This produces more interesting motion than, for example, simply
 * generating a random steering direction each frame.” – Craig Reynolds
 *
 * Vehicle...
 * 1. Predicts future location at a fixed distance in front of it
 * 2. Draws a circle with radius r at that location
 * 3. Picks a random point along the circumference of that circle
 * 4. Random point moves randomly around the circle in each frame
 * 5. Random point is vehicle's target, its desired vector
 */

class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector futureLocation;
  PVector target;
  float lookaheadDistance; // distance to circle
  float lookaheadRadius; // size of circle
  float lookaheadAngle; // angle

  // We need to constrain desired velocity so that the vehicle can't just
  // 'teleport' to its target location.
  float maxspeed;

  // 'Steering' ability (handling)
  float maxforce;

  // Size
  float r;

  Vehicle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    futureLocation = new PVector();
    target = new PVector();
    lookaheadDistance = 100;
    lookaheadRadius = 50;
    lookaheadAngle = 0;
    maxspeed = 3;
    maxforce = 0.1;
    r = 6;
  }

  void run() {
    update();
    wander();
    checkEdges();
    display();
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void wander() {
    float change = 0.2;
    lookaheadAngle += random(-change, change);

    // Future location is current location + lookaheadDistance
    futureLocation = velocity.get(); // copy
    futureLocation.normalize(); // unit vector
    futureLocation.mult(lookaheadDistance);
    futureLocation.add(location); // make it relative to  location

    // Convert from polar to cartesian coordinates
    float x = lookaheadRadius * cos(lookaheadAngle);
    float y = lookaheadRadius * sin(lookaheadAngle);
    PVector desiredLocation = new PVector(x, y);
    target = PVector.add(futureLocation, desiredLocation);
    seek(target);
  }

  void display() {
    // Vehicle is a triangle pointing in the direction of velocity;
    // since it is drawn pointing up, we rotate it an additional 90 degrees.
    float theta = velocity.heading() + PI/2;
    fill(175);
    stroke(0);

    // Vehicle
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();

    // Path
    stroke(0);
    noFill();
    ellipseMode(CENTER);
    ellipse(futureLocation.x, futureLocation.y, lookaheadRadius*2, lookaheadRadius*2);
    ellipse(target.x,target.y,4,4);
    line(location.x, location.y, futureLocation.x, futureLocation.y);
    line(futureLocation.x, futureLocation.y, target.x, target.y);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location); // vector pointing from location to target
    float d = desired.mag(); // distance
    desired.normalize(); // unit vector (direction)
    // If we're closer than 100 pixels...
    if (d < 100) {
      // ...set the magnitude according to how close we are
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(m);
    } else {
      // Proceed at maximum speed
      desired.mult(maxspeed); // constrain
    }
    PVector steer = PVector.sub(desired, velocity); // Reynolds's steering formula (steering = desired - velocity)
    steer.limit(maxforce); // how easy does the vehicle turn?
    applyForce(steer);
  }

  void flee(PVector target) {
    PVector desired = PVector.sub(target, location); // vector from location to target
    desired.normalize(); // unit vector (direction)
    desired.mult(-maxspeed); // constrain and negate
    PVector steer = PVector.sub(desired, velocity); // Reynolds's steering formula
    steer.limit(maxforce); // how easy does the vehicle turn?
    applyForce(steer);
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void checkEdges() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}

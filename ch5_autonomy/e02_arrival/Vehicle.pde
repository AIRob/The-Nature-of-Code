/**
 * Steering: Arrival
 *
 * Q. Why does seek cause the vehicle to fly past the target then turn around?
 * A. Whether it's far away or close it always wants to go as fast as possible.
 *
 * ----X---->
 *
 * To "arrive" a vehicle needs to consider its speed relative to the distance
 * from its target.
 *
 * ---> X
 *
 * Reynolds's steering formula:
 *
 * steering force = desired velocity - current velocity
 *
 * ----------> current
 * ------><--- desired
 *        <--- steering (or "error")
 *
 * Note: This is different from gravitational attraction! - with gravitational
 * attraction, you would never have a force pointing away from the target, no
 * matter how close. But with arriving via steering, if you are moving too fast
 * towards the target, the error would actually tell you to slow down!
 */

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

  Vehicle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector(0.5, 1);
    maxspeed = 4;
    maxforce = 0.1;
    r = 3;
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
}

/**
 * Steering: Walls
 *
 * If a vehicle comes within a distance d of a wall, it desires to move at
 * maximum speed in the opposite direction of the wall.
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

  void checkEdges(float d) {
    PVector desired = null;

    if (location.x < d) {
      desired = new PVector(maxspeed, velocity.y);
    } else if (location.x > width-d) {
      desired = new PVector(-maxspeed, velocity.y);
    } else if (location.y < d) {
      desired = new PVector(velocity.x, maxspeed);
    } else if (location.y > height-d) {
      desired = new PVector(velocity.x, -maxspeed);
    }

    if (desired != null) {
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
}

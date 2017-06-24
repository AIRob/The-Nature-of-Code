/**
 * The term "autonomous agent" generally refers to an entity that makes its own
 * choices about how to act in its environment without any influence from a
 * leader or global plan.
 *
 * There are three key components of autonomous agents:
 *
 * 1. An autonomous agent has a limited ability to perceive environment.
 *
 * 2. An autonomous agent processes the information from its environment and
 *    calculates an action.
 *
 * 3. An autonomous agent has no leader.
 *
 * Rules for autonomous movement (from “Steering Behaviors for Autonomous
 * Characters", Craig Reynolds):
 *
 * 1. Action Selection. A vehicle has a goal (or goals) and can select an action
 * (or a combination of actions) based on that goal.
 *
 * 2. Steering. Once an action has been selected, the vehicle has to calculate
 * its next move.
 *
 * 3. Locomotion. How the vehicle moves.
 *
 * The term Vehicle comes from "Vehicles: Experiments in Synthetic Psychology"
 * by Valentino Braitenberg.
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
}

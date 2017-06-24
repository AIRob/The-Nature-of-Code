class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce;
  float r;

  Vehicle(PVector l) {
    location = l.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    maxspeed = 3;
    maxforce = 0.2;
    r = 3;
  }

  void run() {
    update();
    borders();
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

  PVector separate(ArrayList<Vehicle> vehicles) {
    float desiredSeparation = (r * 2);

    // Required to calculate the average of all vectors pointing away from close vehicles
    PVector sum = new PVector();
    int count = 0;

    for (Vehicle other : vehicles) {
      // What is the distance between me and the other vehicle?
      float d = PVector.dist(location, other.location);

      // By checking for 0 we avoid checking ourself
      if ((d > 0) && (d < desiredSeparation)) {
        // A vector pointing away from the other vehicle
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();

        // Add all vectors together
        sum.add(diff);
        count++;
      }
    }

    // Make sure we found at least one close vehicle
    if (count > 0) {
      sum.div(count);

      // Scale average to maxspeed
      sum.setMag(maxspeed);

      // Reynolds's steering formula
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }

  PVector seek(PVector target) {
    // Vector pointing from location to target
    PVector desired = PVector.sub(target, location);
    // Unit vector (direction)
    desired.normalize();
    // Constrain speed
    desired.mult(maxspeed);
    // Reynolds's steering formula
    PVector steer = PVector.sub(desired, velocity);
    // How easy does the vehicle turn?
    steer.limit(maxforce);
    return steer;
  }

  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    // By returning vectors here...
    PVector separate = separate(vehicles);
    PVector seek = seek(new PVector(mouseX, mouseY));

    // ...we can control the forces in a central place
    separate.mult(1.5);
    seek.mult(0.5);

    applyForce(separate);
    applyForce(seek);
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}

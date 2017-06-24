class Boid {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce;
  float r;

  Boid(PVector l) {
    location = l.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    maxspeed = 3;
    maxforce = 0.2;
    r = 3;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
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
    // Boid is a triangle pointing in the direction of velocity;
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

  PVector separate(ArrayList<Boid> boids) {
    float desiredSeparation = (r * 4);

    // Required to calculate the average of all vectors pointing away from close boids
    PVector sum = new PVector();
    int count = 0;

    for (Boid other : boids) {
      // What is the distance between me and the other boid?
      float d = PVector.dist(location, other.location);

      // By checking for 0 we avoid checking ourself
      if ((d > 0) && (d < desiredSeparation)) {
        // A vector pointing away from the other boid
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();

        // Add all vectors together
        sum.add(diff);
        count++;
      }
    }

    // Make sure we found at least one close boid
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

  // Calculate the average velocity of all the nearby boids.
  PVector align(ArrayList<Boid> boids) {
    float neighborDist = 50;

    PVector sum = new PVector(0, 0);
    int count = 0;

    for (Boid other : boids) {
      sum.add(other.velocity);
      count++;
    }

    if (count > 0) {
      sum.div(count);
      sum.setMag(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Calculate the average location of all the nearby boids.
  PVector cohesion(ArrayList<Boid> boids) {
    float neighborDist = 50;

    PVector sum = new PVector(0, 0);
    int count = 0;

    for (Boid other : boids) {
      sum.add(other.location);
      count++;
    }

    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
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
    // How easy does the boid turn?
    steer.limit(maxforce);
    return steer;
  }

  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);

    sep.mult(1.11);
    ali.mult(1.25);
    coh.mult(1.3);

    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
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

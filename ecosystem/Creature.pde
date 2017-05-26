class Creature {
  PVector location;     // current position
  PVector velocity;     // current direction and speed?
  PVector acceleration; // change in direction and speed?
  PImage img;
  float mass;
  float topspeed;
  float tx = random(0, 1000);
  float ty = random(10000, 20000);

  Creature(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 3;

    int[] emojis = {216, 272, 275, 343, 345, 359};
    String emoji = "emoji-" + emojis[(int) random(emojis.length)] + ".png";
    img = loadImage(emoji);
  }

  void update() {
    // Internal force - desire!
    float x = map(noise(tx), 0, 1, -1, 1);
    float y = map(noise(ty), 0, 1, -1, 1);
    acceleration = new PVector(x, y);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
    tx += 0.01;
    ty += 0.01;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(Food food) {
    PVector force = PVector.sub(food.location, location);
    force.normalize();
    force.mult(2);
    applyForce(force);
  }

  void avoid(Danger danger) {
    PVector force = PVector.sub(danger.location, location);
    force.normalize();
    force.mult(-2);
    applyForce(force);
  }

  void display() {
    noStroke();
    fill(#FFFFD8);
    ellipse(location.x, location.y, mass * 2, mass * 2);
    imageMode(CENTER);
    image(img, location.x, location.y, mass, mass);
  }

  void checkEdges() {
    if (location.x < 0) {
      location.x = width;
    } else if (location.x > width) {
      location.x = 0;
    }
    if (location.y < 0) {
      location.y = height;
    } else if (location.y > height) {
      location.y = 0;
    }
  }
}

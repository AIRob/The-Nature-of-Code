class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector dragOffset;

  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.001;

  boolean dragging = false;

  Mover(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    dragOffset = new PVector();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(255);
    fill(0);
    ellipseMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    ellipse(0, 0, 48, 48);
    popMatrix();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    dragging = true;
    dragOffset.x = location.x-mx;
    dragOffset.y = location.y-my;
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
}

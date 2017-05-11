//
// Bouncing ball with vectors
// ==========================
//
// One way to think of a vector is the difference between two points.
// At its core, a vector is just a convenient way to store two values.
//
// location = current x,y position
// velocity = target x,y position
//
// For every frame:
// new location = location + velocity (velocity applied to current location)
//

class MyVector {
  float x;
  float y;
  
  MyVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  // Vector addition:
  // Add the x components and the y components together
  void add(MyVector v) {
    x = x + v.x;
    y = y + v.y;
  }
}

MyVector location;
MyVector velocity;

void setup() {
  size(500,500);
  background(255);
  
  location = new MyVector(100,100);
  velocity = new MyVector(1,3);
}

void draw() {
  background(255);
  
  location.add(velocity);
  
  if ((location.x > width) || (location.x < 0)) {        
    velocity.x = -velocity.x;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = -velocity.y;
  }  
  
  stroke(0);
  fill(175);  
  ellipse(location.x,location.y,16,16);
}
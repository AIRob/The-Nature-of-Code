/**
 * Vector normalization (direction)
 *
 * Normalizing refers to the process of making something “standard”.
 *
 * To normalize a vector is to take a vector of any length and, keeping it
 * pointing in the same direction, change its length to 1, turning it into what
 * is called a "unit vector".
 *
 * To normalize a vector, simply divide each component by its magnitude.
 *
 */

class MyVector {
  float x;
  float y;

  MyVector(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void add(MyVector v) {
    x = x + v.x;
    y = y + v.y;
  }

  void sub(MyVector v) {
    x = x - v.x;
    y = y - v.y;
  }

  void mult(float n) {
    x = x * n;
    y = y * n;
  }

  void div(float n) {
    x = x / n;
    y = y / n;
  }

  float mag() {
    return sqrt(x*x + y*y);
  }

  void normalize() {
    float m = mag();
    if (m != 0) {
      div(m);
    }
  }
}

void setup() {
  //size(640,360);
  fullScreen();
  background(255);
}

void draw() {
  background(255);

  // Mouse location
  MyVector mouse = new MyVector(mouseX,mouseY);

  // Center of the window
  MyVector center = new MyVector(width/2,height/2);

  // We could just do this
  // line(center.x,center.y,mouse.x,mouse.y);

  // But let's use vector subtraction
  mouse.sub(center);

  // In this example, after the vector is normalized, it is multiplied by 50 so
  // that it is viewable onscreen. Note that no matter where the mouse is, the
  // vector will have the same length (50) due to the normalization process.
  mouse.normalize();
  mouse.mult(50);

  // Translate the center of the window to be 0,0
  translate(width/2,height/2);

  // Draw a line to represent the vector
  line(0,0,mouse.x,mouse.y);
}

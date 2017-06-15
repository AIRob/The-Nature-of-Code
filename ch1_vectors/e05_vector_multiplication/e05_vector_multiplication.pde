/**
 * Vector multiplication
 *
 * When we talk about multiplying a vector, what we typically mean is *scaling*
 * a vector.
 *
 * Multiplication and division, are means by which the length of the vector can
 * be changed without affecting direction.
 *
 * If we wanted to scale a vector to twice its size or one-third of its size
 * (leaving its direction the same), we would say: “Multiply the vector by 2” or
 * “Multiply the vector by 1/3.” Note that we are multiplying a vector by a
 * scalar, a single number, not another vector.
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
}

void setup() {
  //size(640,360);
  fullScreen();
  background(255);
}


void draw() {
  //background(255);

  // Mouse location
  MyVector mouse = new MyVector(mouseX,mouseY);

  // Center of the window
  MyVector center = new MyVector(width/2,height/2);

  // We could just do this
  // line(center.x,center.y,mouse.x,mouse.y);

  // But let's use vector subtraction
  mouse.sub(center);

  // And vector multiplication!
  mouse.mult(6);

  // And vector division!
  mouse.div(0.5);

  // Translate the center of the window to be 0,0
  translate(width/2,height/2);

  // Draw a line to represent the vector
  line(0,0,mouse.x,mouse.y);
}

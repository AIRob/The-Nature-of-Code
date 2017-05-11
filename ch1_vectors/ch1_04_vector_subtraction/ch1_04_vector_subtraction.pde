/**
 * Vector subtraction
 *
 * The following example demonstrates vector subtraction by taking the
 * difference between two points—the mouse location and the center of
 * the window.
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
  translate(width/2,height/2);

  // Draw a line to represent the vector
  line(0,0,mouse.x,mouse.y);
}

/**
 * Vector magnitude (length)
 *
 * “OK, so how do I know what the length of a vector is? I know the components
 * (x and y), but how long (in pixels) is the actual arrow?
 *
 * The 'sides' (x,y) of a vector create a right angled triangle, so we can use
 * the Pythagorean theorem to find out the longest side:
 * a squared plus b squared equals c squared.
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

  // Visualize the length of the vector as a rectangle at top-left
  float m = mouse.mag();
  fill(0);
  rect(0,0,m,10);

  // Translate the center of the window to be 0,0
  translate(width/2,height/2);

  // Draw a line to represent the vector
  line(0,0,mouse.x,mouse.y);
}

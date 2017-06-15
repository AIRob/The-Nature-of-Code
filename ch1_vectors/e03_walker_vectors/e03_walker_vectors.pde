//
// Walker rewritten with vectors
// =============================
//

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
}

class Walker {
  MyVector location;
  MyVector velocity;
    
  Walker() {
    location = new MyVector(width/2,height/2);
  }
  
  void display() {
    stroke(0);
    point(location.x,location.y);
  }
  
  void step() {
    velocity = new MyVector(int(random(3))-1, int(random(3))-1);    
    location.add(velocity);
  }
}

Walker w;

void setup() {
  size(640,360);
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
}
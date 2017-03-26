//
// Gaussian random walker
// ======================
//
// A Gaussian random walk is defined as one in which the step size (how far the 
// object moves in a given direction) is generated with a normal distribution.
//

import java.util.Random;

class Walker {
  int x;
  int y;
  Random generator;
  
  Walker() {
    x = width/2;
    y = height/2;
    generator = new Random();    
  }
  
  void display() {    
    noStroke();
    fill(0);
    ellipse(x,y,3,3);    
  }
  
  void step() {
    int choice = int(random(4));
    
    float num = (float) generator.nextGaussian();
    float mean = 1;
    float sd = 6;
    int stepSize = int(sd * num + mean);    
    
    if (choice == 0) {
      x += stepSize;
    } else if (choice == 1) {
      x -= stepSize;
    } else if (choice == 2) {
      y += stepSize;
    } else {
      y -= stepSize;
    }
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
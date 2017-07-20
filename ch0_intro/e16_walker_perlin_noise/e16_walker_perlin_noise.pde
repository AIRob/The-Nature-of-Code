//
// Perlin noise walker
// ===================
//
// Perlin noise = more "organic" appearance, a "smoother" sequence of pseudo-random numbers.
//
// Metaphor: 1D noise = linear sequence of values over time.
// To access a particular noise value, we pass a specific "moment in time" to `noise()`.
//
// Actual: linear sequence of noise values in a one-dimensional space (not time).
// Might see the variable named `xoff` (x-offset along the noise graph), rather than `t` for time.
//

class Walker {
  float x,y;
  float tx,ty;

  Walker() {
    x = width/2;
    y = height/2;
    // Use two different parts of the "noise space", starting at 0 for x and 10,000 for y
    // so that x and y can appear to act independently of each other.
    tx = 0;
    ty = 10000;
  }

  void display() {
    //stroke(0);
    //point(x,y);
    //noStroke();
    fill(200);
    ellipse(x,y,40,40);
  }

  void step() {
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    tx += 0.01;
    ty += 0.01;
  }
}

Walker w;

void setup() {
  size(640,360);
  background(255);
  w = new Walker();
}

void draw() {
  w.step();
  w.display();
}

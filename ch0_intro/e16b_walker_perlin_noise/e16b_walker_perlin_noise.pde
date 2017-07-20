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
  float prevX, prevY;

  Walker() {
    tx = 0;
    ty = 10000;
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
  }

  void display() {
    stroke(255);
    line(prevX, prevY, x, y);
  }

  void step() {
    prevX = x;
    prevY = y;

    float xStep = map(noise(tx), 0, 1, -5, 5);
    float yStep = map(noise(ty), 0, 1, -5, 5);

    x += xStep;
    y += yStep;

    tx += 0.01;
    ty += 0.01;
  }
}

Walker w;

void setup() {
  background(0);
  size(640,360);
  w = new Walker();
}

void draw() {
  w.step();
  w.display();
}

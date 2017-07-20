//
// Lévy flight walker
// ==================
//
// One strategy to avoid "oversampling" (returning to previously visited locations many times)
// is to, every so often, take a very large step. This variation on the random walk is known
// as a Lévy flight.
//
// Though not an exact implementation of a Lévy flight, we could state the probability
// distribution as follows: the longer the step, the less likely it is to be picked; the shorter
// the step, the more likely
//

class Walker {
  float x;
  float y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    stroke(0);
    point(x,y);
  }

  void step() {
    float r = random(1);
    float xstep;
    float ystep;

    // A 1% chance of taking a large step
    if (r < 0.01) {
      xstep = random(-100,100);
      ystep = random(-100,100);
    } else {
      xstep = random(-1,1);
      ystep = random(-1,1);
    }

    //println(xstep);
    //println(ystep);

    x += xstep;
    y += ystep;
  }
}

Walker w;

void setup() {
  size(640,360);
  w = new Walker(); //<>//
  background(255);
}

void draw() {
  w.step();
  w.display();
}

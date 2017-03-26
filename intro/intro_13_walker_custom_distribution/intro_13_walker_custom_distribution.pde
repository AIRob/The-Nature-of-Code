//
// Custom distribution walker
// ==========================
//
// We can create a custom distribution of random numbers by implemtenting an algorithm
// for a rule that defines what type of randomness we want.
//
// e.g. Rule: The higher a number, the more likely it is to be picked.
//
// 1. Pick a random number: R1
// 2. Compute a probability P that R1 should qualify. Let’s try: P = R1.
// 3. Pick another random number: R2
// 4. If R2 is less than P, then we have found our number—R1!
// 5. If R2 is not less than P, go back to step 1 and start over.
//
// Here we are saying that the likelihood that a random value will qualify is equal 
// to the random number itself. Let’s say we pick 0.1 for R1. This means that R1 will 
// have a 10% chance of qualifying. If we pick 0.83 for R1 then it will have a 83% 
// chance of qualifying.
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
  
  float montecarlo() {
    while (true) {
      float r1 = random(1);
      float probability = r1;
      float r2 = random(1);
      
      if (r2 < probability) {
        return r1;
      }
    }
  }
  
  void step() {
    float stepsize = montecarlo() * 10;
    
    println(stepsize);
    
    float stepx = random(-stepsize,stepsize);
    float stepy = random(-stepsize,stepsize);    
    
    x += stepx;
    y += stepy;
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
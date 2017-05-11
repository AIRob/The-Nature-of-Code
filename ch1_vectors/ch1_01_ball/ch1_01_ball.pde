//
// Simple bouncing ball
// ====================
//
// Notice that for every concept in this 2D world we need 2 variables: x + y.
// In the next example we'll see how we can simplify our code by using vectors.
//

// Location
float x = 100;
float y = 100;

// Speed (or Velocity)
float xspeed = 1;
float yspeed = 3;

void setup() {
  size(500,500);
  background(255);
}

void draw() {
  background(255);

  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 0)) {
    //xspeed = xspeed * -1;
    xspeed = -xspeed;
    println("xspeed:", xspeed);
  }
  if ((y > height) || (y < 0)) {
    //yspeed = yspeed * -1;
    yspeed = -yspeed;
    println("yspeed:", yspeed);
  }

  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
}

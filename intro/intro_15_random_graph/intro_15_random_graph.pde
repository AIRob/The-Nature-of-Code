void setup() {
  fullScreen();
  background(0);
}

float oldx;
float oldy;
float x;
float y;

void draw() {  
  y = random(0, height);
  if (x > width) { 
    x = 0;
  } else {
    x++;
  }

  stroke(255);
  //line(oldx,oldy,x,y);
  point(x,y);
  
  oldx = x;
  oldy = y;
}
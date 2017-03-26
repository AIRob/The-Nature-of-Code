void setup() {
  fullScreen();
  background(0);
}

float x = 0;
float y = 180;
float t = 0;

void draw() {  
  y = height - (noise(t) * height);
  
  stroke(255);
  point(x,y);
  
  //noStroke();
  //fill(random(0, 255), random(0, 255), random(0, 255));
  //ellipse(x,y,3,3);
  
  if (x > width) {
    x = 0;
  } else {
    x++;    
  }  
  t += 0.01;
}
void setup() {
  fullScreen();
  background(0);
}

float x = 0;
float y = 180;
float t = 0;
float s = random(0.001,0.01);

void draw() {
  y = height - (noise(t) * height);
  
  stroke(255);
  point(x,y);

  if (x > width) {
    x = 0;
    s = random(0.001,0.01);
  } else {
    x++;
  }
  t += s;
}

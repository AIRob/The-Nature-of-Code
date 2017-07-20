Vehicle v;
float d;

void setup() {
  size(800, 300);
  v = new Vehicle(width/2, height/2);
  d = 25;
}

void draw() {
  background(255);
  v.update();
  v.checkEdges(d);
  v.display();

  noFill();
  rect(d, d, width-d*2, height-d*2);
}

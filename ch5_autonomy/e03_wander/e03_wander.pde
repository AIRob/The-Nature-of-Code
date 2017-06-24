Vehicle v;

void setup() {
  size(800, 600);
  v = new Vehicle(width/2, height/2);
}

void draw() {
  background(255);
  v.run();
}

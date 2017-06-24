Vehicle[] vehicles = new Vehicle[120];
FlowField f;

void setup() {
  size(640, 360);
  for (int i = 0; i < vehicles.length; i++) {
    vehicles[i] = new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5));
  }
  f = new FlowField();
}

void draw() {
  background(255);
  f.display();
  for (int i = 0; i < vehicles.length; i++) {
    vehicles[i].follow(f);
    vehicles[i].update();
    vehicles[i].checkEdges();
    vehicles[i].display();
  }
}

void mousePressed() {
  f.init();
}

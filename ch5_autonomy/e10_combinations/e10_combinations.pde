/**
 * Group Behaviors (Separation + Seek)
 */

ArrayList<Vehicle> vehicles;

void setup() {
  size(640, 360);
  // fullScreen();

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(255);
  for (Vehicle v : vehicles) {
    v.applyBehaviors(vehicles);
    v.run();
  }
}

void mouseDragged() {
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY)));
}

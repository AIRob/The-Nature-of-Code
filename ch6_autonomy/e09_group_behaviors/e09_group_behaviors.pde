/**
 * Group Behaviors (Separation)
 *
 * Complex Systems:
 * - Simple units with short-range relationships
 * - Simple units operate in parallel
 * - System as a whole exhibits emergent phenomena
 *
 * Additional characteristics:
 * - Non-linearity (small change can have a big effect on the outcome)
 * - Competition and cooperation between elements
 * - Feedback loop (output is fed back into the system)
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
    // Examine all the other vehicles to calculate a separation force
    v.separate(vehicles);
    v.run();
  }
}

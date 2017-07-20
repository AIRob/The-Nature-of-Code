/**
 * Path Following
 */

// Path (series of connected points)
Path path;

// 2 vehicles
Vehicle v1;
Vehicle v2;

void setup() {
  size(640, 360);
  path = new Path();

  // Each vehicle has different maxspeed and maxforce for demo purposes
  v1 = new Vehicle(new PVector(0, height/2), 2, 0.02);
  v2 = new Vehicle(new PVector(0, height/2), 3, 0.05);
}

void draw() {
  background(255);
  path.display();

  v1.follow(path);
  v1.run();
  v1.borders(path);
  
  v2.follow(path);
  v2.run();
  v2.borders(path);
}

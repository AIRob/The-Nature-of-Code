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

  // Generate a path
  path = new Path();
  path.addPoint(-20, height/2);
  path.addPoint(random(0, width/2), random(0, height));
  path.addPoint(random(width/2, width), random(0, height));
  path.addPoint(width+20, height/2);

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

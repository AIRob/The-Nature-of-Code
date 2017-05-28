Cannon c;
Mover m;

void setup( ) {
  size(600, 200);
  c = new Cannon(40, height-25, 40);
  m = new Mover(2, 40, height-25);
}

void draw( ) {
  background(255);
  c.display();
  PVector gravity = new PVector(0, 0.01);

  PVector friction = m.velocity.get(); // clone
  friction.mult(-1); // opposite
  friction.normalize(); // unit vector
  friction.mult(0.1);

  PVector shot = c.shoot();
  m.applyForce(shot);
  m.applyForce(gravity);
  m.applyForce(friction);
  m.update();
  m.display();
  m.checkEdges();
}

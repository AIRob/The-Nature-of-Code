/**
 * Forces - Gravitational Attraction
 *
 * Every object with mass exerts a gravitational force on every other object.
 *
 * Formula:
 *
 *       G * m1 * m2
 * ->F = ––––––––––– r^
 *           r2
 *
 * Big G / big mass = big force
 * Big distance = less force, small distance = more force
 *
 * ->F = the gravitational force (vector) we want to apply.
 *
 * G = the 'universal gravitational constant', can be arbitrary for us.
 *
 * m1 and m2 = the masses of object 1 and 2.
 *
 * r^ = the unit vector pointing from object 1 to object 2.
 *
 * r2 = the distance between the two objects squared.
 */

Mover m;
Attractor a;

void setup() {
  size(640,360);
  m = new Mover(1, random(width), random(height));
  a = new Attractor();
}

void draw() {
  background(255);

  PVector f = a.attract(m);
  m.applyForce(f);

  m.update();

  a.display();
  m.display();
}

/**
 * Forces - Fluid Resistance
 *
 * Friction also occurs when a body passes through a liquid or gas.
 *
 * The result is ultimately the same as friction (our object slows down), but
 * we calculate it differently:
 *
 * Simplified version:
 *
 * 1. Magnitude is speed (velocity mangnitude) squared * coefficient of drag
 * 2. Direction is opposite of velocity
 *
 * magnitude = (velocity.mag() * velocity.mag()) * coefficient
 * direction = velocity.normalize().mult(-1);
 */

Mover[] movers = new Mover[10];
Liquid liquid;

void setup() {
  size(640,360);

  // Create Movers
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), i*50, -i);
  }

  // Create Liquid
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);

  liquid.display();

  for (int i = 0; i < movers.length; i++) {
    // Fluid resistance (drag)
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }

    // Gravity
    float mass = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * mass);

      // Wind
    PVector wind = new PVector(0.05, 0);

    movers[i].applyForce(gravity);
    movers[i].applyForce(wind);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

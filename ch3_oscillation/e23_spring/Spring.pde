/**
 * Spring
 *
 * The force of a spring is calculated according to Hooke’s law:
 *
 * The force of the spring is directly proportional to the extension of the
 * spring.
 *
 * In other words, if you pull on the bob a lot, the force will be strong; if
 * you pull on the bob a little, the force will be weak.
 *
 * Fspring = -k*x
 *
 * k is constant and its value will ultimately scale the force. Is the spring
 * highly elastic or quite rigid?
 *
 * x refers to the displacement of the spring, i.e. the difference between the
 * current length and the rest length. The rest length is defined as the length
 * of the spring in a state of equilibrium.
 */

 class Spring {
   PVector anchor;
   float len;
   float k = 0.05;

   Spring(float x, float y, int l) {
     anchor = new PVector(x, y);
     len = l;
   }

   void connect(Mover m) {
     PVector force = PVector.sub(m.location, anchor);
     float d = force.mag();
     float stretch = d - len;
     force.normalize();
     force.mult(-1 * k * stretch);
     m.applyForce(force);
   }

   void display() {
     fill(100);
     rectMode(CENTER);
     rect(anchor.x, anchor.y, 10, 10);
     stroke(255);
   }

   void displayLine(Mover m) {
     stroke(255);
     line(m.location.x, m.location.y, anchor.x, anchor.y);
   }
 }

/**
 * Pendulum
 *
 * A pendulum is a bob suspended from a pivot.
 *
 * The bob doesn’t fall to the ground because it is attached by an arm to the
 * pivot point. In order to determine its angular acceleration, we not only need
 * to look at the force of gravity, but also the force at the angle of the
 * pendulum’s arm (relative to a pendulum at rest with an angle of 0).
 *
 * The force of the pendulum (Fp) should point perpendicular to the arm of the
 * pendulum in the direction that the pendulum is swinging.
 *
 * Since the force of gravity (Fp) points downward, by making a right triangle
 * out of these two vectors, we’ve made the force of gravity the hypotenuse of a
 * right triangle and separated the vector into two components, one of which
 * represents the force of the pendulum. Since sine equals opposite over
 * hypotenuse, we have:
 *
 * sine(θ) = Fp / Fg
 *
 * Therefore:
 *
 * Fp = Fg * sine(θ)
 *
 * What is the angular acceleration of the pendulum? Once we have the angular
 * acceleration, we can apply our rules of motion to find the new angle:
 *
 * angular velocity = angular velocity + angular acceleration
 * angle = angle + angular velocity
 *
 * We know that there is a relationship between force and acceleration, namely
 * F = M * A, or A = F / M. So if the force of the pendulum is equal to the
 * force of gravity times sine of the angle, then:
 *
 * pendulum angular acceleration = acceleration due to gravity * sine (θ)
 *
 * Which we can simplify to:
 *
 * angular acceleration = gravity * sine(θ)
 */

class Pendulum {
  PVector origin;
  PVector location;
  float armLength;
  float angle;
  float angleVel;
  float angleAcc;
  float damping;

  Pendulum(PVector _origin, float _armLength) {
    origin = _origin.get();
    location = new PVector();
    armLength = _armLength;
    angle = PI/4;
    angleVel = 0;
    angleAcc = 0;
    // An arbitrary damping so that the Pendulum slows over time
    damping = 0.995;
  }

  void go() {
    update();
    display();
  }

  void update() {
    float gravity = 0.4;
    // Formula we worked out for angular acceleration
    angleAcc = (-1 * gravity * sin(angle)) / armLength;
    // Standard angular motion algorithm
    angleVel += angleAcc;
    angle += angleVel;
    angleVel *= damping;
  }

  void display() {
    // Where is the bob relative to the origin? Polar to Cartesian coordinates will tell us!
    location.set(armLength*sin(angle),armLength*cos(angle),0);
    location.add(origin);
    stroke(0);
    line(origin.x,origin.y,location.x,location.y);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }
}

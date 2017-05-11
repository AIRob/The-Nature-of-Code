/**
 * Custom PVector implementation for learning.
 * Named it AVector so it get's imported before Mover.
 */

class AVector {
  float x;
  float y;

  AVector(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void add(AVector v) {
    x = x + v.x;
    y = y + v.y;
  }

  void sub(AVector v) {
    x = x - v.x;
    y = y - v.y;
  }

  void mult(float n) {
    x = x * n;
    y = y * n;
  }

  void div(float n) {
    x = x / n;
    y = y / n;
  }

  float mag() {
    return sqrt(x*x + y*y);
  }

  void normalize() {
    float m = mag();
    if (m != 0) {
      div(m);
    }
  }

  void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
    }
  }
}

/**
 * Oscillation - Simple Harmonic Motion (multiple)
 */

Oscillator[] oscillators = new Oscillator[10];

void setup( ) {
  size(500, 500);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
}

void draw( ) {
  background(255);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].update();
    oscillators[i].display();
  }
}

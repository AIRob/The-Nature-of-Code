/**
 * Oscillation - Simple Harmonic Motion (multiple)
 */

Oscillator[] oscillators = new Oscillator[10];

void setup( ) {
  fullScreen();
  background(0);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator(i+1);
  }
}

void draw( ) {
  // background(255);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].update();
    oscillators[i].display();
  }
}

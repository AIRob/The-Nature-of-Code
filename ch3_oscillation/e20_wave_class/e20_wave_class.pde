/**
 * Waves – OOP
 *
 * Encapsulate the previous examples into a Wave class and create a sketch that
 * displays two waves (with different amplitudes/periods).
 *
 * Move beyond plain circles and lines and try visualizing the wave in a more
 * creative way.
 */

Wave[] waves = new Wave[5];

void setup() {
  size(800,300);
  for (int i = 0; i < waves.length; i++) {
    waves[i] = new Wave(random(width), random(height), random(200), random(100));
  }
}

void draw( ) {
  background(255);
  for (int i = 0; i < waves.length; i++) {
    waves[i].update();
    waves[i].display();
  }
}

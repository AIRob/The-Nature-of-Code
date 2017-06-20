/**
 * Ecosystem simulation
 *
 * Step 3:
 *
 * Take one of your creatures and incorporate oscillation into its motion.
 * You can use the Oscillator class from Example 3.7 as a model. The Oscillator
 * object, however, oscillates around a single point (the middle of the window).
 * Try oscillating around a moving point. In other words, design a creature that
 * moves around the screen according to location, velocity, and acceleration.
 * But that creature isn’t just a static shape, it’s an oscillating body.
 * Consider tying the speed of oscillation to the speed of motion. Think of a
 * butterfly’s flapping wings or the legs of an insect. Can you make it appear
 * that the creature’s internal mechanics (oscillation) drive its locomotion?
 */

Creature[] creatures = new Creature[10];

float minMass = 20;
float maxMass = 40;

void setup() {
  size(800, 800);

  for (int i = 0; i < creatures.length; i++) {
    creatures[i] = new Creature(20, width/2, height/2);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < creatures.length; i++) {
    creatures[i].update();
    creatures[i].display();
    creatures[i].checkEdges();
  }
}

/**
 * Ecosystem simulation
 *
 * Step 2:
 *
 * Incorporate the concept of forces into your ecosystem. Try introducing other
 * elements into the environment (food, a predator) for the creature to interact
 * with. Does the creature experience attraction or repulsion to things in its
 * world? Can you think more abstractly and design forces based on the
 * creature’s desires or goals?
 */

Creature[] creatures = new Creature[(int) random(1, 10)];
Food[] foods = new Food[(int) random(1, 8)];
Danger[] dangers = new Danger[(int) random(1, 5)];

float G = 0.4; // gravity
float minMass = 20;
float maxMass = 40;

void setup() {
  fullScreen();
  background(255);

  for (int i = 0; i < creatures.length; i++) {
    creatures[i] = new Creature(random(minMass, maxMass), random(width), random(height));
  }

  for (int i = 0; i < foods.length; i++) {
    foods[i] = new Food(random(minMass, maxMass), random(width), random(height));
  }

  for (int i = 0; i < dangers.length; i++) {
    dangers[i] = new Danger(random(minMass, maxMass), random(width), random(height));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < creatures.length; i++) {
    creatures[i].update();
    // creatures[i].seek(foods[(int) random(foods.length)]);
    // creatures[i].avoid(dangers[(int) random(dangers.length)]);
    creatures[i].seek(foods[0]);
    // creatures[i].avoid(dangers[0]);
    creatures[i].display();
    creatures[i].checkEdges();
  }

  for (int i = 0; i < foods.length; i++) {
    foods[i].display();
  }

  for (int i = 0; i < dangers.length; i++) {
    dangers[i].display();
  }
}

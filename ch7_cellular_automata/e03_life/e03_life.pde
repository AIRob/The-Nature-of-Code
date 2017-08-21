/**
 * Conway's "Game of Life"
 *
 * Exhibit the characteristics of biological systems of reproduction...
 * ...with the simplest set of rules possible.
 *
 * - Instead of a line of cells, we now have a two-dimensional matrix of cells.
 *
 * - If a neighbor is an adjacent cell, a neighborhood is now nine cells instead of three.
 *
 * - With nine cells, we have 9 bits, or 512 possible neighborhoods.
 *
 * - The typical visualization is to treat each generation as a single frame in an animation.
 *   So instead of viewing all the generations at once, we see them one at a time. (It’s important
 *   to note that the cells themselves aren’t actually moving, although we see the appearance of
 *   motion in the result as the cells turn on and off).
 *
 * It would be impractical to define an outcome for every possibility, so we define a set of rules
 * according to general characteristics of the neighborhood:
 *
 * - 1. Death:
 *
 *   If a cell is alive (state = 1) it will die (state = 0) under the following circumstances:
 *
 *   - Overpopulation: If the cell has four or more alive neighbors, it dies.
 *
 *   - Loneliness: If the cell has one or fewer alive neighbors, it dies.
 *
 * - 2. Birth:
 *
 *   If a cell is dead (state = 0) it will come to life (state becomes 1) if it has exactly three
 *   alive neighbors (no more, no less).
 *
 * - 3. Stasis:
 *
 *   In all other cases, the cell state does not change:
 *
 *   - Stay Alive: If a cell is alive and has exactly two or three live neighbors, it stays alive.
 *
 *   - Stay Dead: If a cell is dead and has anything other than three live neighbors, it stays dead.
 */

CA ca;

void setup() {
  size(800, 400);
  frameRate(12);
  ca = new CA();
}

void draw() {
  background(255);
  ca.generate();
  ca.display();
}

void mousePressed() {
  ca.init();
}

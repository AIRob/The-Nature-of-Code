/**
 * Cellular Automata (Simple)
 *
 * Cellular Automata = a model of a system of “cell” objects:
 *
 * - The cells live on a grid
 * - Each cell has a state (1,0 / on/off / alive/dead)
 * - Each cell has a neighborhood (adjacent cells)
 * - Cells change over time ('generation') according to some rule
 *
 * What is the simplest cellular automaton we can imagine?
 *
 * - Grid - one-dimensional line of cells
 * - States - 0 or 1 (random)
 * - Neighborhood - 3 cells (left + self + right)
 *
 * How do we compute the states for all cells at each generation?
 *
 * A cell’s new state is a function of all the states in the cell’s
 * neighborhood at the previous moment in time (generation).
 *
 * We have three cells, each with a state of 0 or 1.
 * Three cells define a 3-bit number, so we can count up to 8:
 *
 * 000  001   010   011   100   101   110   111
 *  1    2     3     4     5     6     7     8
 *
 * Once we have defined all the possible neighborhoods, we need to define an
 * outcome (new state value: 0 or 1) for each neighborhood configuration:
 *
 * 000  001   010   011   100   101   110   111
 *  0    1     0     1     1     0     1     0
 *
 * The standard Wolfram model is to start generation 0 with all cells having a
 * state of 0 except for the middle cell, which should have a state of 1:
 *
 *  0   0   0   1   0   0   0   0
 *  1   2   3   4   5   6   7   8
 *
 * Referring to the ruleset above, let’s see how a given cell (we’ll pick the
 * center one) would change from generation 0 to generation 1:
 *
 * Generation 0:
 * 0   0   [0   1   0]   0   0   0
 *             [0]
 *
 * Generation 1:
 * 0   0   0   [0]   0   0   0   0
 *
 * We define a “ruleset” as a list of 8 bits (Eight 0s/1s means an 8-bit number):
 *
 * "Rule 90" (01011010 = 90)
 * 0 1 0 1 1 0 1 0
 *
 * How many combinations of eight 0s and 1s are there? 256.
 *
 * In terms of a Wolfram elementary CA, we have now discovered that there are
 * 256 possible rulesets.
 */

CA ca;

void setup() {
  size(800, 400);
  background(255);
  ca = new CA();
}

void draw() {
  ca.display();
  if (ca.generation < height/ca.w) {
    ca.generate();
  }
}

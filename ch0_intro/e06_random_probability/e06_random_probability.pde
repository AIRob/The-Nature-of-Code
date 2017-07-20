//
// Using `random()` to achieve probability
// =======================================
//

/**
 * a) Picking from an array of numbers (some repeated)
 * ---------------------------------------------------
 *
 * Fill an array with a selection of numbers—some of which are repeated
 * then choose random numbers from that array and generate events based on those choices.
 * Running this code will produce a 40% chance of printing the value 1,
 * a 20% chance of printing 2, and a 40% chance of printing 3.
 */

int[] stuff = new int[5];
// 1 and 3 are stored in the array twice, making them more likely to be picked.
stuff[0] = 1;
stuff[1] = 1;
stuff[2] = 2;
stuff[3] = 3;
stuff[4] = 3;
// Picking a random element from an array
int index = int(random(stuff.length));
//print(stuff[index]);


/**
 * b1) Random number ranges – single outcome
 * -----------------------------------------
 *
 * Ask for a random number and allow an event to occur only if our random number is
 * within a certain range.
 */

// A probability of 10%
float prob = 0.10;
// A random floating point value between 0 and 1
float r = random(1);
println(r);
// If our random number is less than 0.1, you win!
if (r < prob) {
  //println("you win!");
}

/**
 * b2) Random number ranges – multiple outcomes
 * --------------------------------------------
 *
 * This method can also be applied to multiple outcomes. Let’s say that Outcome A has a 60%
 * chance of happening, Outcome B, a 10% chance, and Outcome C, a 30% chance. We implement
 * this in code by picking a random float and seeing into what range it falls.
 *
 * - between 0.00 and 0.60 (60%) –> Outcome A
 * - between 0.60 and 0.70 (10%) –> Outcome B
 * - between 0.70 and 1.00 (30%) –> Outcome C
 */

float num = random(1);

// If random number is less than 0.6
if (num < 0.6) {
  println("Outcome A");
// Between 0.6 and 0.7
} else if (num < 0.7) {
  println("Outcome B");
// Greater than 0.7
} else {
  println("Outcome C");
}

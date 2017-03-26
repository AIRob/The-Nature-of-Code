/** 
 * Single event probability
 * ------------------------
 *
 * _The likelihood that a given event will occur._
 *
 * If you have *a system with a certain number of possible outcomes*, the probability of the 
 * occurrence of a given event equals the number of outcomes that qualify as that event 
 * divided by the total number of all possible outcomes:
 *
 * probability = qualifying outcome / possible outcomes
 * 
 * Examples:
 *
 * Coin toss:
 * 1 side / 2 sides (heads or tails) = 1 / 2 = 0.5 = 50%
 *
 * Drawing an ace from a deck of fifty-two cards:
 * number of aces / number of cards = 4 / 52 = 0.077 = ~ 8%
 *
 * Multiple events probability
 * ---------------------------
 *
 * _The likelihood of multiple events occurring in sequence._
 *
 * To do this, we simply multiply the individual probabilities of each event:
 *
 * probability = (qualifying outcome / possible outcomes) ^ how many times
 * 
 * Examples:
 * A coin turning up heads three times in a row:
 *
 * (1/2) * (1/2) * (1/2) = 1/8 = 0.125 = ~ 12.5%
 *
 * ...meaning that a coin will turn up heads three times in a row one out of eight times 
 * (each "time" being three tosses).
 *
 * Exercise I.2
 * ------------
 *
 * What is the probability of drawing two aces in a row from a deck of fifty-two cards?
 *
 * (4/52) * (4/52) = 16/2704 = 0.006 = 0.06%
 * 
 * (0.077) * (0.077) = 0.006 = 0.06%
 *
 */

 
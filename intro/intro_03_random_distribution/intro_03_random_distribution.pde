// An array to keep track of how often random numbers are picked.
int[] randomCounts;

void setup() {
  size(640, 240);
  randomCounts = new int[20];
}

void draw() {
  background(255);

  // Pick a random number and increase the count.
  int index = int(random(randomCounts.length));
  randomCounts[index]++;

  stroke(0);
  fill(175);
  int w = width/randomCounts.length;
  // Graphing the results.
  for (int x = 0; x < randomCounts.length; x++) {
    // x-coordinate (left)
    int a = x*w;
    // y-coordinate (top)
    int b = height-randomCounts[x];
    // width
    int c = w-1;
    // height
    int d = randomCounts[x];

    rect(a, b, c, d);
    text(x, a, b);
  }
}
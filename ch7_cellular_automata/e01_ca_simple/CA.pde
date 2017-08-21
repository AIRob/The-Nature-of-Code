class CA {
  int[] cells;
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};
  int w = 10;
  int generation = 0;

  CA() {
    // How many cells fit across given the sketch width?
    cells = new int[width/w];

    // All cells start with state 0...
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }

    // ...except the middle cell which starts with state 1
    cells[cells.length/2] = 1;
  }

  void generate() {
    int[] nextgen = new int[cells.length];

    // Compute the next generation
    // (ignore the first and last cells as they don't have a complete neighborhood)
    for (int i = 1; i < cells.length-1; i++) {
      // Look at the cells from the current generation
      int left = cells[i-1];
      int middle = cells[i];
      int right = cells[i+1];

      // Save the new generation
      nextgen[i] = rules(left, middle, right);
    }

    // The next generation becomes the current generation
    cells = nextgen;
    generation++;
  }

  int rules(int a, int b, int c) {
    if (a==1 && b==1 && c==1) return ruleset[0];
    else if (a == 1 && b == 1 && c == 0) return ruleset[1];
    else if (a == 1 && b == 0 && c == 1) return ruleset[2];
    else if (a == 1 && b == 0 && c == 0) return ruleset[3];
    else if (a == 0 && b == 1 && c == 1) return ruleset[4];
    else if (a == 0 && b == 1 && c == 0) return ruleset[5];
    else if (a == 0 && b == 0 && c == 1) return ruleset[6];
    else if (a == 0 && b == 0 && c == 0) return ruleset[7];
    return 0;
  }

  void display() {
    for (int i = 1; i < cells.length-1; i++) {
      if (cells[i] == 0) {
        fill(255);
      } else {
        fill(0);
      }
      noStroke();
      // Set x for each cell in the row
      // Set y for each generation
      rect(i*w, generation*w, w, w);
    }
  }
}

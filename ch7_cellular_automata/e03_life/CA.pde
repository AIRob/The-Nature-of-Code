class CA {
  int columns, rows;
  int w = 8;
  int[][] board;

  CA() {
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];
    init();
  }

  void init( ) {
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        board[x][y] = int(random(2));
      }
    }
  }

  void generate() {
    int[][] next = new int[columns][rows];

    // Compute the next generation
    // (skipping the edge cells)
    for (int x = 1; x < columns-1; x++) {
      for (int y = 1; y < rows-1; y++) {
        int neighbors = 0;

        // Top row
        if (board[x-1][y-1] == 1) neighbors++;
        if (board[x][y-1] == 1)   neighbors++;
        if (board[x+1][y-1] == 1) neighbors++;

        // Middle row (skip self)
        if (board[x-1][y] == 1) neighbors++;
        if (board[x+1][y] == 1) neighbors++;

        // Bottom row
        if (board[x-1][y+1] == 1) neighbors++;
        if (board[x][y+1] == 1)   neighbors++;
        if (board[x+1][y+1] == 1) neighbors++;

        // We could also write the above like this:
        // for (int i = -1; i <= 1; i++) {
        //   for (int j = -1; j <= 1; j++) {
        //     neighbors += board[x+i][y+j];
        //   }
        // }
        // Skip self (subtract the current cell)
        // neighbors -= board[x][y];

        // The rules of life
        // If alive and less than 2 live neighbors: die (loneliness)
        if ((board[x][y] == 1) && (neighbors < 2)) {
          next[x][y] = 0;
        }
        // If alive and more than 3 live neighbors: die (overpopulation)
        else if ((board[x][y] == 1) && (neighbors > 3)) {
          next[x][y] = 0;
        }
        // If dead and exactly 3 live neighbors: born (reproduction)
        else if ((board[x][y] == 0) && (neighbors == 3)) {
          next[x][y] = 1;
        }
        // In all other cases: stasis (no change)
        else {
          next[x][y] = board[x][y];
        }

        // More compact version of the above:
        // if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;
        // else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;
        // else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;
        // else next[x][y] = board[x][y];
      }
    }

    // The next generation becomes the current generation
    board = next;
  }

  void display() {
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        if (board[x][y] == 1) {
          fill(0);
        } else {
          fill(255);
        }
        stroke(0, 30);
        // Set x for each cell in the row
        // Set y for each generation
        rect(x*w, y*w, w, w);
      }
    }
  }
}

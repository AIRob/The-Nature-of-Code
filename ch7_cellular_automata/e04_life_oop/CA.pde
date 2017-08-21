class CA {
  int columns, rows;
  int w = 8;
  Cell[][] board;

  CA() {
    columns = width/w;
    rows = height/w;
    board = new Cell[columns][rows];
    init();
  }

  void init( ) {
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        board[x][y] = new Cell(x*w, y*w, w);
      }
    }
  }

  void generate() {
     for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        board[i][j].savePrevious();
      }
    }
    
    // Compute the next generation
    // (skipping the edge cells)
    for (int x = 1; x < columns-1; x++) {
      for (int y = 1; y < rows-1; y++) {

        // Add up all the alive neighbors
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[x+i][y+j].previous;
          }
        }
        // Skip self (subtract the current cell)
        neighbors -= board[x][y].previous;

        // The rules of life
        if      ((board[x][y].state == 1) && (neighbors <  2)) board[x][y].newState(0); // loneliness
        else if ((board[x][y].state == 1) && (neighbors >  3)) board[x][y].newState(0); // overpopulation
        else if ((board[x][y].state == 0) && (neighbors == 3)) board[x][y].newState(1); // reproduction
        // else ...statis
      }
    }
  }

  void display() {
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        board[x][y].display();
      }
    }
  }
}

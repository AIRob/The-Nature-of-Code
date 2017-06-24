class FlowField {
  PVector[][] field;
  int cols, rows;
  int resolution;

  FlowField() {
    resolution = 20;
    // Total columns equals width divided by resolution.
    cols = width/resolution;
    // Total rows equals height divided by resolution.
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
  }

  void init() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float angle = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        // PVector v = new PVector(1, 0); // right
        // PVector v = PVector.random2D(); // random
        // float x = i*resolution;
        // float y = j*resolution;
        // PVector v = new PVector(width/2-x, height/2-y); // center
        // v.normalize();

        // Polar to Cartesian coordinate transformation to get x and y components of the vector
        PVector v = new PVector(cos(angle), sin(angle)); // perlin noise
        field[i][j] = v;
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  void display() {
    // Reseed noise so we get a new flow field every time
    noiseSeed((int)random(10000));
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        pushMatrix();
        stroke(0, 100);
        translate(i * resolution, j * resolution);
        PVector v = field[i][j];
        rotate(v.heading2D());
        line(0, 0, resolution-2, 0);
        popMatrix();
      }
    }
  }

  PVector lookup(PVector v) {
    // Contrain values to ensure we don't look out of bounds
    int column = int(constrain(v.x/resolution, 0, cols-1));
    int row = int(constrain(v.y/resolution, 0, rows-1));
    // Return a copy
    return field[column][row].get();
  }
}

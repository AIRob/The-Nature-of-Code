//
// 2D Noise
// ========
//

float increment = 0.01;
float xoff = 0.0;
//float zoff = 0.0;
//float zincrement = 0.02;

void setup() {
  size(300, 300);
  // fullScreen();
  background(255);
  noiseDetail(8,0.65f);
  loadPixels();
}

void draw() {
  for (int x = 0; x < width; x++) {
    xoff += increment;
    float yoff = 0.0; // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment;
      float bright = map(noise(xoff,yoff),0,1,0,255);
      // Calculate noise and scale by 255
      //float bright = noise(xoff,yoff,zoff)*255;
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();
  //zoff += zincrement;
}

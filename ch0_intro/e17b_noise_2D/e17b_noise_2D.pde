//
// 2D Noise
// ========
//
// 1D noise = on a linear line a value has 2 neighbors (left / right).
//
// 2D noise = on a grid a value has 8 neighbors (left / right / up / down / diagonals).
//

size(500, 300);

loadPixels();

//println(pixels.length);

float xoff = 0.0;

// Grid traversal (5x3 = 15px)
//
// x=0, y=0
// pixels[0+0*5] = 0
//
//   0 1 2 3 4
// 0 o x x x x
// 1 x x x x x
// 2 x x x x x
//
// x=0, y=1
// pixels[0+1*5] = 5
//
//   0 1 2 3 4
// 0 x x x x x
// 1 o x x x x
// 2 x x x x x
//
// x=0, y=2
// pixels[0+2*5] = 10
//
//   0 1 2 3 4
// 0 x x x x x
// 1 x x x x x
// 2 o x x x x
//
// ...
//
// x=1, y=0
// pixels[1+0*5] = 1
//
//   0 1 2 3 4
// 0 x o x x x
// 1 x x x x
// 2 x x x x x
//
// x=1, y=1
// pixels[1+1*5] = 6
//
//   0 1 2 3 4
// 0 x x x x x
// 1 x o x x x
// 2 x x x x x
//

// Columns
for (int x = 0; x < width; x++) {
  // For every xoff, start yoff at 0
  float yoff = 0.0;  
  
  float bright = map(noise(xoff, yoff), 0, 1, 0, 255);  
  
  // Rows
  for (int y = 0; y < height; y++) {
    //float bright = random(255);
    // Use xoff and yoff for noise
    //float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
    //println("pixel: ", x+(y*width));
    // Use x and y for pixel location
    //pixels[x+(y*width)] = color(bright);
    yoff += 0.01;
  } 
  
  pixels[x] = color(bright);

  xoff += 0.01;
}

updatePixels();
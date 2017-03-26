//
// 2D Noise
// ========
//
// 1D noise = on a linear line a value has 2 neighbors (left / right).
//
// 2D noise = on a grid a value has 8 neighbors (left / right / up / down / diagonals).
//

size(300,300);
background(255);

loadPixels();

println("width:", width);
println("height:", height);

// Pixels looks like this for `size(3,3)`:
//
// [ 0,1,2
//   3,4,5
//   6,7,8 ] //<>//
//

for (int x = 0; x < pixels.length; x++) {
  pixels[x] = color(random(255));
}

//// Go through each pixel from left to right
//for (int x = 0; x < width; x++) { //<>//
//  // For the current x pixel, go through each pixel from top to bottom
//  float bright = random(255);
//  pixels[x] = color(bright);
//  //for (int y = 0; y < height; y++) {
//  //  // A random brightness!
//  //  float bright = random(255);
//  //  // 
//  //  println("x", x);
//  //  println("y", y);
//  //  println("x+y", x+y);
//  //  println("x+y*width", x+y*width);
//  //  pixels[x+y*width] = color(bright);
//  //  //pixels[x+y] = color(bright);
//  //  //pixels[x+y*height] = color(bright);  
//  //}
//}

updatePixels();
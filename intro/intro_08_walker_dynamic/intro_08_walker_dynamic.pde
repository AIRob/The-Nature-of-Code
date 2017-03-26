class Walker {
  int x;
  int y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
    stroke(0);
    point(x,y);
  }
  
  /**
   * Step has the following probabilities:
   * - chance of moving towards the mouse: 50%
   * - chance of moving up: 12.5%
   * - chance of moving down: 12.5%
   * - chance of moving left: 12.5%
   * - chance of moving right: 12.5%
   */
  void step() {
    float r = random(1);
    if (r < 0.5) {
      // Move towards the mouse
      // current position = x, y
      // mouse position = mouseX, mouseY
      if (mouseX > x) {
        x++;
      } else {
        x--;
      }
      if (mouseY > y) {
        y++;
      } else {
        y--;
      }
    } else if (r < 0.625) {
      x++;      
    } else if (r < 0.75) {
      x--;
    } else if (r < 0.875) {
      y++;
    } else {
      y--;
    }
  }
}

Walker w;

void setup() {
  size(640,360);
  //fullScreen();
  w = new Walker();
  background(255);
}

void draw() {
  println(mouseX, mouseY);
  w.step();
  w.display();
}
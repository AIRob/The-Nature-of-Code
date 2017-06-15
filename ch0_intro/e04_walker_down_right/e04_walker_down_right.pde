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
  
  void step() {
    int chance = int(random(6));
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    
    if (chance == 0) {
      x++;
      y++;
    } else {
      x += stepx;
      y += stepy;      
    }
  }
}

Walker w;

void setup() {
  //size(640,360);
  fullScreen();
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
}
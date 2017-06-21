Spaceship ship;

void setup() {
  size(800, 600);
  ship = new Spaceship();
}

void draw() {
  background(0);
  ship.go();
}

void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-0.03);
  } else if (keyCode == RIGHT) {
    ship.turn(0.03);
  } else if (key == 'z') {
    ship.thrust();
  }
}

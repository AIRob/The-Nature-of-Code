class Food {
  PImage img;
  PVector location;
  float mass;

  Food(float m, float x, float y) {
    location = new PVector(x, y);
    mass = m;
    int[] emojis = {123, 124, 134, 138, 144, 145, 163};
    String emoji = "emoji-" + emojis[(int) random(emojis.length)] + ".png";
    img = loadImage(emoji);
  }

  void display() {
    noStroke();
    fill(#DFFFEF);
    ellipse(location.x, location.y, mass * 2, mass * 2);
    imageMode(CENTER);
    image(img, location.x, location.y, mass, mass);
  }
}

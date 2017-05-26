class Danger {
  PImage img;
  PVector location;
  float mass;

  Danger(float m, float x, float y) {
    location = new PVector(x, y);
    mass = m;
    int[] emojis = {364, 367, 404, 410, 530};
    String emoji = "emoji-" + emojis[(int) random(emojis.length)] + ".png";
    img = loadImage(emoji);
  }

  void display() {
    noStroke();
    fill(#FFDFDF);
    ellipse(location.x, location.y, mass * 2, mass * 2);
    imageMode(CENTER);
    image(img, location.x, location.y, mass, mass);
  }
}

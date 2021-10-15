class Particle extends GameObject {
  
  float t;
  color fill;

  Particle(float x, float y, color colour) {
    lives = 1;
    loc = new PVector(x, y);
    t = random(200, 255);
    size = int(random(2, 13));
    v = new PVector(0, 1);
    v.rotate(random(0, TWO_PI));
    fill = colour;
  }

  void show() {
    strokeWeight(0.25);
    stroke(0);
    fill(fill, t);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    t-=5;
    if (t <= 0) lives = 0;
  }
}

class Bullet extends GameObject {

  int timer;
  color fill;

  Bullet() {
    timer = 60; //<>//
    lives = 1;
    size = 5; //<>//
  }

  void show() {
    
    fill(fill);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    timer--;
    if (timer == 0) lives = 0;
  }
}

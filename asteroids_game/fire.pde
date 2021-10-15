class Fire extends GameObject {

  int t; //transparency
  PVector nudge;

  Fire() {
    lives = 1;
    size = int(random(2, 13));
    t = int(random(200, 255));
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(35);
    loc.add(nudge);
    
    v = myShip.direction.copy();
    v.rotate(PI + random(-0.5, 0.5));
    v.setMag(2);
  }

  void show() {
    fill(255, 0, 0, t);
    noStroke();
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    t -= 5;
    if (t <= 0) lives = 0;
  }
}

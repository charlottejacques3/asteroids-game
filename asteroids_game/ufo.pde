class Ufo extends GameObject {

  PVector direction;
  int shotTimer, threshold, origin;

  Ufo() {
    
    //make it appear at the corners
    origin = int(random(0, 4));
    if (origin == 0) {
      loc = new PVector(random(0, width), -size);
      v = new PVector(0, 1);
    } else if (origin == 1) {
      loc = new PVector(width + size, random(0, height));
      v = new PVector(-1, 0);
    } else if (origin == 2) {
    loc = new PVector(random(0, width), height + size);
    v = new PVector(0, -1);
    } else if (origin == 3) {
    loc = new PVector(-size, random(0, height));
    v = new PVector(1, 0);
    }
    
    direction = new PVector(0, -0.1);
    lives = 1;
    size = 160;
    shotTimer = 0;
    threshold = 100;
  }

  void show() {
    image(alien, loc.x, loc.y, size, size);
  }

  void act() {
    super.act();
    shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new UfoBullet(loc.x, loc.y, myShip.loc.x - loc.x, myShip.loc.y - loc.y, v));
      shotTimer = 0;
    }

    //check for bullets
    int i = 0;
    while (i < myObjects.size()) {
      GameObject o = myObjects.get(i);
      if (o instanceof ShipBullet) {
        if (dist (loc.x, loc.y, o.loc.x, o.loc.y) <= (size+o.size)/2) {
          o.lives = 0;
          lives = 0;
          ufoAlive = false;
          ufoThreshold = int(random(400, 2000));
          
          //make particles
          int n = 0;
          while (n < 55) {
            myObjects.add(new Particle(loc.x, loc.y, #92D63A));
            n++;
          }
        }
      }
      i++;
    }
  }
}

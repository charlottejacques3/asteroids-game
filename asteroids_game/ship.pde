class Ship extends GameObject { //<>//

  PVector direction;
  int shotTimer, shotThreshold, immunTimer, immunThreshold, shieldT;
  color colour;

  Ship() {
    loc = new PVector(width/2, height/2);
    v = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    lives = 3;
    shotTimer = 0;
    shotThreshold = 30;
    immunTimer = 0;
    immunThreshold = 240;
    size = 50;
    colour = #FFFFFF;
    shieldT = 180;
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(direction.heading());
    noStroke();
    fill(colour);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
  }

  void act() {
    super.act();
    
    if (spaceKey && shotTimer > shotThreshold) {
      myObjects.add(new ShipBullet());
      shotTimer = 0;
    }

    //limit speed
    if (v.mag() > 8) v.setMag(8);

    shotTimer++;
    immunTimer++;

    //keyboard controls
    if (upKey) {
      v.add(direction);
      myObjects.add(new Fire());
    }
    if (downKey) {
      v.sub(direction);
    }
    
    
    
    if (!upKey && !downKey) v.mult(0.95); //slow down
    if (leftKey) direction.rotate(-radians(5));
    if (rightKey) direction.rotate(radians(5));

    

    int i = 0;
    while (i < myObjects.size()) {
      GameObject o = myObjects.get(i);
      
      //interactions with asteroids
      if (o.lives != 0 && o instanceof Asteroid) {

        //make it lose lives
        if (dist(loc.x, loc.y, o.loc.x, o.loc.y) < (size+o.size)/2 && immunTimer >= immunThreshold) {
          lives--;
          loc = new PVector(width/2, height/2);
          v = new PVector(0, 0);
          direction = new PVector(0, -0.1);
          immunTimer = 0;
          shieldT = immunThreshold;
        }

        //teleport
        if (tKey && teleTimer >= 350) {
          loc = new PVector(random(size/2, width-size/2), random(size/2 + 50, height-size/2));
          teleTimer = 0;
          while (dist(loc.x, loc.y, o.loc.x, o.loc.y) < (size + o.size)/2 + 200) {
            loc.x = random(size/2, width-size/2);
            loc.y = random(size/2, height-size/2);
          }
        }
      }
      
      //make it die when hit by ufo bullets
      if (o instanceof UfoBullet) {
        if (dist (loc.x, loc.y, o.loc.x, o.loc.y) <= (size+o.size)/2 && immunTimer >= immunThreshold) {
          o.lives = 0;
          lives--;
          loc = new PVector(width/2, height/2);
          v = new PVector(0, 0);
          direction = new PVector(0, -0.1);
          immunTimer = 0;
          shieldT = immunThreshold;
        }
      }
      i++;
    }

    //increase teletimer
    if (teleTimer < 350) teleTimer++;

    //add shield when immune
    if (immunTimer < immunThreshold) {
      tint(255, shieldT);
      image(shield, loc.x, loc.y, size*3/2, size*3/2);
      shieldT--;
      noTint();
    }
  }
}

class UfoBullet extends Bullet {

  PVector nudge; 

  UfoBullet(float x, float y, float vx, float vy, PVector velocity) {
    super();
    fill = #FF0000;
    
    loc = new PVector(x, y);
    v = new PVector(vx, vy);
    v.add(velocity);
    v.setMag(10);

    //nudge
    //nudge = myUfo.direction.copy();
    //nudge.rotate(radians(70));
    //nudge.setMag(85);
    //loc.add(nudge);
  }
}

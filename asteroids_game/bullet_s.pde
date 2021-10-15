class ShipBullet extends Bullet {
  
  ShipBullet() {
    super();
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    v = new PVector(myShip.direction.x, myShip.direction.y);
    fill = #FFFFFF; //<>//
    
    v.add(myShip.v);
    v.setMag(10);
  }
}

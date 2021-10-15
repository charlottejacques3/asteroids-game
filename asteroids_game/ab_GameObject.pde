class GameObject {
  PVector loc, v;
  int lives, size;
  
  GameObject() {
    
  }
  
  void show() {
    
  }
  
  void act() {
    loc.add(v);
    
    //when going off the screen
    if (loc.y < 50 - size/2 - 10) loc.y = height + size/2 + 10;
    if (loc.y > height + size/2 + 10) loc.y = 50 - size/2 - 10;
    if (loc.x < - size/2 - 10) loc.x = width + size/2 + 10;
    if (loc.x > width + size/2 + 10) loc.x = - size/2 - 10;
  }
}

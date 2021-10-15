void gameover() {
  background(0);
  fill(0, 255, 0);
  //get rid of remaining objects
  int i = 0;
  while (i < myObjects.size()) {
    myObjects.remove(i);
    i++;
  }

  //if lost
  if (myShip.lives == 0) {
    textFont(leftItalic);
    text("GAME", 445, height/2-100);
    textFont(rightItalic);
    text("OVER", 755, height/2-100);
  } else { //if won
    textFont(leftItalic);
    text("YOU", 475, height/2-100);
    textFont(rightItalic);
    text("WON", 725, height/2-100);
  }

  //try again
  textFont(leftItalic);
  textSize(30);
  text("click to ", 520, height/2+100);
  textFont(rightItalic);
  textSize(30);
  text("try again", 680, height/2+100);
}

void gameoverClicks() {
  mode = INTRO;
  myShip.lives = 3;
  myObjects.add(myShip);
  numAsteroids = 3;
  int i = 0;
  while (i < numAsteroids) {
    myObjects.add(new Asteroid());
    i++;
  }
}

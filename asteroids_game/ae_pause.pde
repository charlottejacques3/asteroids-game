void pause() {
  textSize(50);
  text("GAME PAUSED", width/2, height/2-100);
  textSize(20);
  text("click to continue", width/2, height/2+100);
}

void pauseClicks() {
  mode = GAME;
}

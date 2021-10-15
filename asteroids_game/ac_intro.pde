void intro() {
  //gif
  image(gif[frame], width/2, height/2, width, height);
  frame++;
  if (frame >= gifLength) frame = 0;
  
  //game name
  fill(0, 255, 0);
  textFont(leftItalic);
  text("MONS", 460, 350);
  text("& AL", 475, 450);
  textFont(rightItalic);
  text("TERS", 740, 350);
  text("IENS", 725, 450);
  
  //click to start
  textFont(leftItalic);
  textSize(20);
  text("CLICK T", 557, 600);
  textFont(rightItalic);
  textSize(20);
  text("O START", 643, 600);
}

void introClicks() {
  mode = GAME;
}

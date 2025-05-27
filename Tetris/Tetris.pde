private Game board;
PGraphics pg;

void setup(){
  background(255);
  size(500,750);
  pg = createGraphics(430,650);
  //startGame();
  delay(1000);
  //endGame();
}

void draw(){
  /*
  loadPixels();
  for (int i = 0; i < height; i++) {
    pixels[i] = color(0,0,0);
  }
  updatePixels();
  */
  pg.beginDraw();
  pg.background(100);
  pg.stroke(0);
  pg.endDraw();
  image(pg, 9, 30);
}

public void keyPressed() {
  for (int i = 0; i < board.size(); i++) {
    if (key == CODED) {
      if (keyCode == UP) {
        // turn CW
        board.getBlocks(i).turn();
      }
      else if (keyCode == DOWN) {
        // accelerate
        board.getBlocks(i).accelerate(10);
      }
      else if (keyCode == LEFT) {
        // move left
        board.getBlocks(i).move(-1);
      }
      else if (keyCode == RIGHT) {
        // move right
        board.getBlocks(i).move(1);
      }
    }
  }
}

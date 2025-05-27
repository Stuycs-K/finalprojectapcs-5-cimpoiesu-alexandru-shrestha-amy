private Game board;

void setup(){
  size(500,750);
  //startGame();
  delay(1000);
  //endGame();
}

void draw(){
  
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
        board.getBlocks(i).move(-1,0);
      }
      else if (keyCode == RIGHT) {
        // move right
        board.getBlocks(i).move(1,0);
      }
    }
  }
}

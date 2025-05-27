import java.util.*;
private Game board;

void setup(){
  background(255);
  size(500,750);
  //startGame();
  delay(1000);
  //endGame();
<<<<<<< HEAD
  draw();
=======
  text("Level " + getLevel(),0,0);
>>>>>>> alexandru-cimpoiesu
}

void draw(){
  loadPixels();
  for (int i = 0; i < height; i++) {
    pixels[i] = color(0,0,0);
  }
  updatePixels();
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
<<<<<<< HEAD
        board.getBlocks(i).move(-1);
      }
      else if (keyCode == RIGHT) {
        // move right
        board.getBlocks(i).move(1);
=======
        board.getBlocks(i).move(-1,0);
      }
      else if (keyCode == RIGHT) {
        // move right
        board.getBlocks(i).move(1,0);
>>>>>>> alexandru-cimpoiesu
      }
    }
  }
}

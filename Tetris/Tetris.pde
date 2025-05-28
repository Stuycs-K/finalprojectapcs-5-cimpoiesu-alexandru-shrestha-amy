import java.util.*;
private Game board = new Game();

void setup(){
  background(255);
  size(500,725);
  //startGame();
  //delay(1000);
  //endGame();
  draw();
}

void draw(){
  background(255);
  
  // text for score + level
  fill(0);
  textSize(15);
  String levelStr = "Level: " + board.getLevel();
  text(levelStr, 20, 670);
  String scoreStr = "Score: " + board.getScore();
  text(scoreStr, 20, 690);
  
  // screen for tetris
  stroke(0);
  fill(200,100);
  rect(15,15,width-30,635);
  
  // update movement of block
  for (int i = 0; i < board.getBlocks().size(); i++) {
    if (board.getBlocks(i).inBounds()) {
      board.getBlocks(i).update();
      board.getBlocks(i).display();
    }
  }
  board.getBlocks(0).display();
  
  // only moving current block
  /*
  Block currBlock = board.getBlocks(0);
  while (currBlock.inBounds()) {
    currBlock.update();
    currBlock.display();
  }
  */
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

// placeholder, used to get position of text
public void mousePressed() {
  System.out.println(mouseX + "," + mouseY);
}

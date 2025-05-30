import java.util.*;
private Game board = new Game();

void setup(){
  background(255);
  size(580,660);
  //startGame();
  //delay(1000);
  //endGame();
  draw();
}

void draw(){
  background(255);
  
  // screen for tetris
  // should be 10 blocks wide, 20 blocks high
  stroke(5);
  fill(200,50); // opacity 50
  rect(30,30,300,600);
  
  // screen for nextBlock
  rect(360, 30, width-30-360, 180);
  
  // screen for text
  rect(360, 240, width-30-360, 90);
  line(360, 285, 550, 285);
  
  // text for score + level
  fill(0);
  textSize(25);
  String levelStr = "LEVEL:     " + board.getLevel();
  text(levelStr, 380, 271);
  String scoreStr = "SCORE:    " + board.getScore();
  text(scoreStr, 380, 315);
  
  // update movement of block
  for (int i = 0; i < board.getBlocks().size(); i++) {
     Block currBlock = board.getBlocks(i);
    if (currBlock.getY() + currBlock.getHeight() >= 630) {
       currBlock.setY(629 - currBlock.getHeight());
       currBlock.update();
       currBlock.display();
       System.out.println(currBlock.getY() + currBlock.getHeight());
    }
    //System.out.println(currBlock.getHeight() > currBlock.getY()-30);
    if (currBlock.inBounds(currBlock.getX(), currBlock.getY())) {
      currBlock.update();
      currBlock.display();
    }
    //System.out.println(currBlock.getSpeed());
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
int timesdown = 0;
public void keyPressed() {
  for (int i = 0; i < board.getSize(); i++) {
    if (key == CODED) {
      if (keyCode == UP) {
        // turn CW
        board.getBlocks(i).turn();
      }
      else if (keyCode == DOWN) {
        // accelerate
          board.getBlocks(i).accelerate(10);
          timesdown++;
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

public void keyReleased(){
  for (int i = 0; i < board.getSize(); i++) {
     if (key == CODED) {
       if (keyCode == DOWN) {
         board.getBlocks(i).accelerate(-10 * timesdown); 
         timesdown = 0;
       }
     }
  }
}
// placeholder, used to get position of text
public void mousePressed() {
  System.out.println(mouseX + "," + mouseY);
}

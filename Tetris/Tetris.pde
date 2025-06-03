import java.util.*;
Game board = new Game();
int timesdown = 0;

void setup(){
  size(580,660);
  background(255);
  // possible start screen
  //startGame();
}

void draw(){
  background(255);
  
  // screen for tetris (10 blocks wide, 20 blocks high)
  stroke(5);
  // color of screen, etc.
  fill(64,20); // 2nd value opacity
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
  Tetromino currBlock = board.getCurr();
     Block[][] myBlocks = currBlock.getBlocks();
     
     //check if currBlock has hit the bottom
     if (currBlock.needNextBlock()){
       delay(500);
       board.nextBlock();
       currBlock = board.getCurr();
       myBlocks = currBlock.getBlocks();
     }
    
    if (currBlock.inBounds()) {
      currBlock.update();
      currBlock.display();
      currBlock.setMove(false);
    }
    
    // display all blocks in block ary
    for (int i = 0; i < board.getSize(); i++) {
      board.getBlockArray(i).display();
    }
}
  
void keyPressed() {
  for (int i = 0; i < board.getSize(); i++) {
    Block[][] blocks = board.getCurr().getBlocks();
    if (key == CODED) {
      if (keyCode == UP) {
        // turn CW
        for (int r = 0; r < blocks.length; r++) {
          for (int c = 0; c < blocks[r].length; c++) {
            // FIX TURNING FOR THE TETROMINO
            // because the position of the block needs to be moved not just the angle
            blocks[r][c].turn();
            board.getCurr().setupCoor();
          }
        }
      }
      else if (keyCode == DOWN) {
        // accelerate
        timesdown+=board.getCurr().accelerate(10);
      }
      else if (keyCode == LEFT) {
        // move left
        if (board.getCurr().canMove(-1,0)) {
          board.getCurr().move(-1,0);
        }
      }
      else if (keyCode == RIGHT) {
        // move right
        if (board.getCurr().canMove(-1,0)) {
          board.getCurr().move(1,0);
        }
      }
    }
  }
}

void keyReleased(){
  Block[][] blocks = board.getCurr().getBlocks();
  if (key == CODED) {
       if (keyCode == DOWN) {
         for (int r = 0; r < blocks.length; r++) {
          for (int c = 0; c < blocks[r].length; c++) {
           board.getCurr().getBlocks()[r][c].accelerate(-10*timesdown);
          }
         }
         timesdown = 0;
       }
   }
}

// placeholder, used to get position of text
void mousePressed() {
  System.out.println(mouseX + "," + mouseY);
  //board.endGame();
}

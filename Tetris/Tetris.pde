import java.util.*;
private Game board = new Game();
//private int timesdown = 0;

void setup(){
  size(580,660);
  background(255);
  // possible start screen
  //startGame();
}

void draw(){
  background(255);
  board.update();
  board.play();
  /*
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
  for (int i = 0; i < board.getBlockArray().size(); i++) {
     Tetromino currBlock = board.getBlockArray(i);
     Block[] myBlocks = currBlock.getBlocks();
     
     //check if currBlock has hit the bottom
     if (currBlock.needNextBlock()) {
       currBlock = board.getCurr();
       myBlocks = currBlock.getBlocks();
     }
    
    if (currBlock.inBounds()) {
      currBlock.update();
      currBlock.display();
      currBlock.setMove(false);
    }
    else {
      board.nextBlock();
    }
    
    // make sure it doesn't exceed the screen
    for (int f = 0; f < 4; f++) {
      if (myBlocks[f].getY() + myBlocks[f].getHeight() > 630 && myBlocks[f].getMove()) {
        myBlocks[f].setY(630 - myBlocks[f].getHeight());
      }
    }
      /*
    if (currBlock.getY() + currBlock.getHeight() >= 630 && currBlock.getMove()) {
       System.out.println("Hi");
       currBlock.setY(630 - currBlock.getHeight());
       currBlock.update();
       currBlock.display();
       currBlock.setMove(false);
    }
    //System.out.println(currBlock.getHeight() > currBlock.getY()-30);
    if (currBlock.inBounds(currBlock.getX(), currBlock.getY())) {
      currBlock.update();
      currBlock.display();
    }
    //System.out.println(currBlock.getSpeed());
  }
  board.getBlockArray(0).display(); */
}
  
public void keyPressed() {
  /*
      if (keyCode == UP) {
        // turn CW
        for (int f = 0; f < 4; f++) {
          // FIX TURNING FOR THE TETROMINO
          // because the position of the block needs to be moved not just the angle
          board.getBlockArray(i).getBlocks()[f].turn();
        }
      }
      */
      if (keyCode == DOWN) {
        if(!board.currentBlock.move(0,1,board.screen)){
          board.currentBlock.atBottom(board.screen);
          board.clearRow();
          board.spawnTetromino();
        }
       
        // accelerate
        //timesdown+=board.getBlockArray(i).accelerate(10);
      }
      else if (keyCode == LEFT) {
        // move left
      board.currentBlock.move(-1,0,board.screen);
      }
      else if (keyCode == RIGHT) {
        // move right
        board.currentBlock.move(1,0,board.screen);
        }
  }  
/*

public void keyReleased(){
  for (int i = 0; i < board.getSize(); i++) {
     if (key == CODED) {
       if (keyCode == DOWN) {
         for (int f = 0; f < 4; f++) {
           board.getBlockArray(i).getBlocks()[f].accelerate(-10*timesdown);
         }
         timesdown = 0;
       }
     }
  }
}

// placeholder, used to get position of text
public void mousePressed() {
  System.out.println(mouseX + "," + mouseY);
  //board.endGame();
}*/

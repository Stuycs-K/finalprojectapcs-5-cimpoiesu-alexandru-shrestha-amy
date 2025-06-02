import java.util.*;
private Game board = new Game();
private int timesdown = 0;

void setup(){
  background(255);
  size(580,660);
  // possible start screen
  //startGame();
  
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
     Block[] currBlock = board.getBlocks(i);
     
    // update and display each block in the current block
    // make sure to CHANGE THE INDEXES (may turn into 2d array for shape)
    if (currBlock[i].inBounds(currBlock[0].getX(), currBlock[0].getY()) && currBlock[3].inBounds(currBlock[3].getX(), currBlock[3].getY())) {
      for (int f = 0; f < 4; f++) {
        currBlock[f].update();
        currBlock[f].display();
      }
    }
    
    // make sure it doesn't exceed the screen
    for (int f = 0; f < 4; f++) {
      if (currBlock[f].getY() + currBlock[f].getHeight() > 630) {
        currBlock[f].setY(630 - currBlock[f].getHeight());
      }
    }
  }
  
  // displays each individual block of the current block (INDEX 0 - CHANGE THIS LATER)
  for (int g = 0; g < 4; g++) {
    board.getBlocks(0)[g].display();
  }
}

public void keyPressed() {
  for (int i = 0; i < board.getSize(); i++) {
    if (key == CODED) {
      if (keyCode == UP) {
        // turn CW
        for (int f = 0; f < 4; f++) {
          // FIX TURNING FOR THE TETROMINO
          // because the position of the block needs to be moved not just the angle
          board.getBlocks(i)[f].turn();
        }
      }
      else if (keyCode == DOWN) {
        // accelerate
        for (int f = 0; f < 4; f++) {
          board.getBlocks(i)[f].accelerate(10);
          timesdown++;
        }
      }
      else if (keyCode == LEFT) {
        // move left
        for (int f = 0; f < 4; f++) {
          board.getBlocks(i)[f].move(-1,0);
        }
      }
      else if (keyCode == RIGHT) {
        // move right
        for (int f = 0; f < 4; f++) {
          board.getBlocks(i)[f].move(1,0);
        }
      }
    }
  }
}

public void keyReleased(){
  for (int i = 0; i < board.getSize(); i++) {
     if (key == CODED) {
       if (keyCode == DOWN) {
         for (int f = 0; f < 4; f++) {
           board.getBlocks(i)[f].accelerate(-10*timesdown);
         }
         timesdown = 0;
       }
     }
  }
}

// placeholder, used to get position of text
public void mousePressed() {
  System.out.println(mouseX + "," + mouseY);
}

import java.util.*;
private Game board = new Game();

void setup(){
  background(255);
  size(500,725);
  //startGame();
  //delay(1000);
  //endGame();
  draw();
  
  // text for score + level
  fill(0);
  textSize(15);
  String levelStr = "Level: " + board.getLevel();
  text(levelStr, 40, 670);
  String scoreStr = "Score: " + board.getScore();
  text(scoreStr, 40, 690);
}

void draw(){
  background(255);
  stroke(0);
  fill(200,100);
  rect(15,15,width-30,635);
  for (int i = 0; i < board.getBlocks().size(); i++) {
    board.getBlocks(i).update();
    board.getBlocks(i).display();
  }
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
        // move right
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

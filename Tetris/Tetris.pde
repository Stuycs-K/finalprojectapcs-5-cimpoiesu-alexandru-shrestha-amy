private Game board;

void setup(){
  size(500,750);
  //startGame();
  delay(1000);
  endGame();
}

void draw(){
  
}

public void keyPressed() {
  for (int i = 0; i < blocks.size(); i++) {
    if (key == CODED) {
      if (keyCode == UP) {
        // turn CW
        blocks.get(i).turn();
      }
      else if (keyCode == DOWN) {
        // accelerate
        blocks.get(i).accelerate(10);
      }
      else if (keyCode == LEFT) {
        // move left
        blocks.get(i).move(-1);
      }
      else if (keyCode == RIGHT) {
        // move right
        blocks.get(i).move(1);
      }
    }
  }

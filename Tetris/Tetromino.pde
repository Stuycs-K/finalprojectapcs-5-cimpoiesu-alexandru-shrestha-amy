public class Tetromino {
  private Block[] blocks;
  private int millisec, speedDelay;
  
  public Tetromino(Block[] blocks) {
    this.blocks = blocks;
    this.millisec = millis();
    this.speedDelay = 550;
  }
  
  public void update() {
    int currentMilli = millis();
    if (currentMilli - millisec >= speedDelay) {
      for (int f = 0; f < blocks.length; f++) {
        if (blocks[f].inBounds(blocks[f].getX(), blocks[f].getY())) {
         blocks[f].setY(blocks[f].getY() + blocks[f].getHeight());
        }
      }
      millisec = currentMilli;
    }
  }
  
  public void display() {
    for (int f = 0; f < blocks.length; f++) {
      blocks[f].display();
    }
  }
  
  public Block[] getBlocks() {
    return blocks;
  }
  
  public int getSpeed() {
    return speedDelay;
  }
  
  public void setSpeed(int num) {
    this.speedDelay = num;
  }
}
  

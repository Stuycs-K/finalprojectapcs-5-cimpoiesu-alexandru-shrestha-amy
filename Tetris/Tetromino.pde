public class Tetromino {
  private Block[] blocks;
  private int millisec, speedDelay;
  private boolean canMove;
  private int[][] xy;
  
  public Tetromino(Block[] blocks) {
    this.blocks = blocks;
    this.millisec = millis();
    this.speedDelay = 550;
    this.canMove = true;
    this.xy = new int[4][2];
    setupCoor();
  }
  
  public void setupCoor() {
    for (int r = 0; r < 4; r++) {
       this.xy[r][0] = blocks[0].getX();
       this.xy[r][1] = blocks[0].getY();
    }
  }
  
  public void update() {
    int currentMilli = millis();
    if (currentMilli - this.millisec >= speedDelay) {
      for (int f = 0; f < blocks.length; f++) {
        if (blocks[f].inBounds(blocks[f].getX(), blocks[f].getY())) {
           blocks[f].setY(blocks[f].getY() + blocks[f].getHeight());
        }
      }
      this.millisec = currentMilli;
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
  
  public int accelerate(int num) {
    int times = 0;
    for (int f = 0; f < blocks.length; f++) {
      this.speedDelay -= num;
      if (this.speedDelay < 1) {
        this.speedDelay = 1;
      }
      times++;
    }
    return times;
  }
 
  public void setMove(boolean val){
     for (int g = 0; g < 4; g++) {
       this.canMove = val;
     }
  }
  
  public boolean getMove(){
     return canMove;
  }
  
  public boolean needNextBlock() {
    for (int f = 0; f < blocks.length; f++) {
      if ((blocks[f].getY() + blocks[f].getHeight()) >= 630) {
        return true;
      }
    }
    return false;
  }
  
  public boolean inBounds() {
    boolean allInBound = true;
    for (int f = 0; f < 4; f++) {
      if (!(getBlocks()[f].inBounds(getBlocks()[f].getX(), getBlocks()[f].getY()))) {
        allInBound = false;
      }
    }
    return allInBound;
  }
}
  

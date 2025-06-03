public class Tetromino {
  private Block[][] blocks;
  private int millisec, speedDelay;
  private boolean canMove;
  private int[][] xy;
  
  public Tetromino(Block[][] blocks) {
    this.blocks = blocks;
    this.millisec = millis();
    this.speedDelay = 550;
    this.canMove = true;
    this.xy = new int[4][2];
    setupCoor();
  }
  
  public void setupCoor() {
    // [top left, top right, bottom left, bottom right]
    int topLX = Integer.MAX_VALUE, topLY = Integer.MAX_VALUE, topRX = Integer.MIN_VALUE, topRY = Integer.MIN_VALUE;
    int bottomLX = Integer.MAX_VALUE, bottomLY = Integer.MAX_VALUE, bottomRX = Integer.MIN_VALUE, bottomRY = Integer.MIN_VALUE;
    
    for (int r = 0; r < blocks.length; r++) {
      for (int c = 0; c < blocks[0].length; c++) {
        Block b = blocks[r][c];
        if (b != null) {
          int x = b.getX();
          int y = b.getY();
          
          if (x < topLX && y < topLY) {
          topLX = x;
          topLY = y;
        }
        if (x < topRX && y < topRY) {
          topRX = x;
          topRY = y;
        }
        if (x < bottomLX && y > bottomLY) {
          bottomLX = x;
          bottomLY = y;
        }
        if (x > bottomRX && y > bottomRY) {
          bottomRX = x;
          bottomRY = y;
        }
        }
      }
    }
          
    this.xy[0][0] = topLX;
    this.xy[0][1] = topLY;
    
    this.xy[1][0] = topRX;
    this.xy[1][1] = topRY;
    
    this.xy[2][0] = bottomLX;
    this.xy[2][1] = bottomLY;
    
    this.xy[3][0] = bottomRX;
    this.xy[3][1] = bottomRY;
  }
  
  public void update() {
    int currentMilli = millis();
    if (currentMilli - this.millisec >= speedDelay) {
      for (int r = 0; r < blocks.length; r++) {
        for (int c = 0; c <  blocks[0].length; c++) {
          if (blocks[r][c] != null && blocks[r][c].inBounds(blocks[r][c].getX(), blocks[r][c].getY())) {
             blocks[r][c].setY(blocks[r][c].getY() + blocks[r][c].getHeight());
          }
        }
      }
      this.millisec = currentMilli;
    }
  }
  
  public void display() {
    for (int r = 0; r < blocks.length; r++) {
      for (int c = 0; c <  blocks[0].length; c++) {
        if (blocks[r][c] != null) {
        blocks[r][c].display();
        }
      }
    }
  }
  
  public Block[][] getBlocks() {
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
    for (int r = 0; r < blocks.length; r++) {
      for (int c = 0; c <  blocks[0].length; c++) {
        if (blocks[r][c] != null && (blocks[r][c].getY() + blocks[r][c].getHeight()) >= 630) {
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean inBounds(int x, int y) {
    return ((x+blocks[0][0].getWidth()) <= 330 && x >= 30 && y >= 30 && (y+blocks[0][0].getHeight()) < 630);
  }
  
  public boolean inBounds() {
    for (int r = 0; r < blocks.length; r++) {
      for (int c = 0; c <  blocks[0].length; c++) {
        if (blocks[r][c] != null && !(blocks[r][c].inBounds(blocks[r][c].getX(), blocks[r][c].getY()))) {
          return false;
        }
      }
    }
    return true;
  }
}
  

public class Tetromino {
  private Block[] blocks;
  private int millisec, speedDelay;
  color c;
  //private boolean canMove;
  //private int[][] xy;
  
  public Tetromino(Block[] blocks) {
    this.blocks = blocks;
    this.c = c;
    //this.millisec = millis();
    //this.speedDelay = 550;
    //this.canMove = true;
    //this.xy = new int[4][2];
    //setupCoor();
  }
  /*
  public void setupCord() {
    for (int r = 0; r < 4; r++) {
       this.xy[r][0] = blocks[0].getX();
       this.xy[r][1] = blocks[0].getY();
    }
  }
  */
  /*
  public void update() {
    int currentMilli = millis();
    if (currentMilli - lastDrop > speedDelay) {
      for (int f = 0; f < blocks.length; f++) {
        if (blocks[f].inBounds(blocks[f].getX(), blocks[f].getY())) {
           blocks[f].setY(blocks[f].getY() + blocks[f].getHeight());
        }
      }
      this.millisec = currentMilli;
    }
  }
  */
  public void display() {
    for (int f = 0; f < blocks.length; f++) {
      blocks[f].display();
    }
  }
  
public boolean rotate(Block[][] grid) {
    if (blocks[0].getColor() == color(255, 255, 0)) {
       return false;
    }
    int index = 1;
    Block pivot = blocks[index];
    Block[] rotated = new Block[4];
    for (int i = 0; i < blocks.length; i++){
        Block block = blocks[i];
        if (i == index) {
            rotated[i] = new Block(block.x, block.y, color(0, 0, 0));
            continue;
        }
        int rotatedX = pivot.x + (block.y - pivot.y);
        int rotatedY = pivot.y -(block.x - pivot.x);
        if (!inBounds(rotatedX, rotatedY) || grid[(rotatedY - 30) / block.getSize()][(rotatedX - 30) / block.getSize()] != null) {
            return false;
        }
        rotated[i] = new Block(rotatedX, rotatedY, color(0, 0, 0));
    }
    for (int i = 0; i < blocks.length; i++) {
        blocks[i].x = rotated[i].x;
        blocks[i].y = rotated[i].y;
    }
    return true;
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
  
  public boolean move(int x, int y, Block[][]grid){
    for(Block block:blocks){
      int Xcor = block.x + x * block.getSize();
      int Ycor = block.y + y * block.getSize();
      if(!block.inBounds(Xcor,Ycor) || grid[(Ycor -30) / block.getSize()][(Xcor-30) / block.getSize()]!=null)
    {
       return false; 
    }
   }
   for(Block block:blocks){
    block.x += x * block.getSize();
    block.y += y * block.getSize();
   }
   return true;
  }
  
  public boolean inBounds(int x, int y) {
    return x < 330 && x >= 30 && y >= 30 && y < 630;
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
 
 /*
  public void setMove(boolean val){
     for (int g = 0; g < 4; g++) {
       this.canMove = val;
     }
  }
  
  public boolean getMove(){
     return canMove;
  }
  */
  
  public boolean inBounds() {
    for (int r = 0; r < blocks.length; r++) {
        if (blocks[r]!= null) {
          if (!blocks[r].inBounds(blocks[r].getX(), blocks[r].getY())) {
            return false;
          }
        }
    }
    return true;
  }
  
  private boolean atBottom;
  public void atBottom(Block[][] game) {
    //boolean allInBound = true;
    for (Block block : blocks) {
      int row = (block.getY() - 30) / block.getSize();
      int col = (block.getX() - 30) / block.getSize();
      if (row >= 0 && row < 20 && col >= 0 && col < 10) {
        game[row][col] = block;
        atBottom = true;
      }
    }
  }
}
  

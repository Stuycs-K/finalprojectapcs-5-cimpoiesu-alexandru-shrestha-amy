public class Block {
  private int x, y;
  //private int angle;
  //private int bWidth, bHeight; //we don't need both of these each block is a square
  private int bSize; // only 1 dimension needed
  //private int millisec, speedDelay;
  //private boolean canMove;
  
  public Block(){
    //this.angle = 0;
    this.x = 150;
    this.y = 30;
    this.bSize = 30;
    //this.bWidth = 30;
    //this.bHeight = 30;
    //this.millisec = millis();
    //this.speedDelay = 550;
    //this.canMove = true;
  }
  
  public Block(int x, int y){
    //this.angle = 0;
    this.x = x;
    this.y = y;
    this.bSize = 30;
    //this.bWidth = 30;
    //this.bHeight = 30;
    //this.millisec = millis();
    
    //this.speedDelay = 550;
    //this.canMove = true;
  }
  
  // automatic falling of block
  // SHOULD BE BLOCK BY BLOCK
  /*
 public void update() {
    int currentMilli = millis();
    // calc a delay that doesn't affect the update()
    // so it moves y based on delay in milliseconds
    if (currentMilli - millisec >= speedDelay) {
      if (inBounds(x, y)) {
        this.y += bHeight;
      }
      millisec = currentMilli;
    }
  }
  */
  public void display() {
    // color of rect
    fill(128,100);
    rect(x,y,bSize,bSize);
    stroke(0);
    noFill();
    rect(x, y, bSize, bSize);
    noStroke();
  }
  
  // returns true if in bounds of tetris block screen
  public boolean inBounds(int x, int y) {
    return x < 330 && x >= 30 && y >= 30 && y < 630;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getSize(){
     return bSize; 
  }
  
 /*
  public void setMove(boolean val){
     this.canMove = val;
  }
  
  public boolean getMove(){
     return canMove;
  }

  // increase the speed of the block
  public void accelerate(int num) {
    speedDelay -= num;
    if (speedDelay < 1) {
      speedDelay = 1;
    }
  }
  
  public int getAngle() {
    return angle;
  }
  
  public int getSpeed() {
    return speedDelay;
  }
   
  public int getWidth() {
    return bWidth;
  }
  
  public int getHeight() {
    return bHeight;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public void setSpeed(int num) {
    this.speedDelay = num;
  }
  
  // turns the block CW by 90 degrees
  // will not exceed 360 degrees
  public void turn() {
    this.angle += 90;
    this.angle = angle % 360;
  }
  
  // move the block left or right by one
  // depending on key
  
  public void move(int posx, int posy) {
    // right
    if (posx > 0 && posy == 0 && inBounds(x+bWidth, y)) {
      this.x+=bWidth;
    }
    // left
    else if (posx < 0 && posy == 0 && inBounds(x-bWidth, y)) {
      this.x-=bWidth;
    }
    else if (y + posy > 630){
       this.speedDelay = 630 - bHeight;
    }
  }
  */
}

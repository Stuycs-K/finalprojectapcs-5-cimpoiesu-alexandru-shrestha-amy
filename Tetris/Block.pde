public class Block {
  private int x;
  private int y;
  private int angle;
  private int bWidth;
  private int bHeight;
  private int millisec;
  private int speedDelay;

  
  public Block(){
    this.angle = 0;
    this.x = 150;
    this.y = 30;
    this.bWidth = 30;
    this.bHeight = 30;
    this.millisec = millis();
    this.speedDelay = 550;
  }
  
  public Block(int x, int y){
    this.angle = 0;
    this.x = x;
    this.y = y;
    this.bWidth = 30;
    this.bHeight = 30;
    this.millisec = millis();
    
    this.speedDelay = 550;
  }
  
  // automatic falling of block
  // SHOULD BE BLOCK BY BLOCK
 public void update() {
    int currentMilli = millis();
    // calc a delay that doesn't affect the update()
    // so it moves y based on delay in milliseconds
    if (currentMilli - millisec >= speedDelay) {
      if (inBounds(x, y)) {
        y += bHeight;
      }
      millisec = currentMilli;
    }
  }
  
  public void display() {
    fill(20,100);
    rect(x,y,bWidth,bHeight);
  }
  
  // returns true if in bounds of tetris block screen
  public boolean inBounds(int x, int y) {
    return ((x+bWidth) <= 330 && x >= 30 && y >= 30 && (y+bHeight) < 630);
  }
 
  
  // increase the speed of the block
  public void accelerate(int num) {
    speedDelay -= (num*10);
    if (speedDelay < 0) {
      speedDelay = 1;
    }
  }
  
  public int getAngle() {
    return angle;
  }
  
  public int getSpeed() {
    return speedDelay;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
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
  
  // turns the block CW by 90 degrees
  // will not exceed 360 degrees
  public void turn() {
    angle += 90;
    angle = angle % 360;
  }
  
  // move the block left or right by one
  // depending on key
  public void move(int posx, int posy) {
    // right
    if (posx > 0 && posy == 0 && inBounds(x+1, y)) {
      x+=bWidth;
    }
    // left
    else if (posx < 0 && posy == 0 && inBounds(x-1, y)) {
      x-=bWidth;
    }
  }
}

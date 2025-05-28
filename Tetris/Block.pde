public class Block {
  private int x;
  private int y;
  private int angle;
  private int speed;
  private int bWidth;
  private int bHeight;
  
  public Block(){
    this.angle = 0;
    this.speed = 10;
    this.x = 15;
    this.y = 15;
    this.bWidth = 25;
    this.bHeight = 40;
  }
  
  public Block(int speed, int angle){
    this.angle = angle;
    this.speed = speed;
    this.x = 15;
    this.y = 15;
    this.bWidth = 10;
    this.bHeight = 20;
  }
  
  // automatic falling of block
  public void update() {
    y += speed/10;
  }
  
  public void display() {
    fill(20,100);
    rect(x,y,bWidth,bHeight);
  }
  
  // returns true if in bounds of tetris block screen
  public boolean inBounds() {
    return ((x+bWidth) <= 480 && x >= 15 && y >= 15 && (y+bHeight) <= 650);
  }
 
  
  // increase the speed of the block depending on 
  // need to fix so it only accelerates while key is being pressed
  public void accelerate(int num) {
    speed += num;
  }
  
  public int getAngle() {
    return angle;
  }
  
  public int getSpeed() {
    return speed;
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
    if (posx > 0 && posy > 0) {
      
    }
    // left
    else{
      
    }
  }
}

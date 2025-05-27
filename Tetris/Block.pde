public class Block {
  private int angle;
  private int speed;
  
  public Block(){
    this.angle = 0;
    this.speed = 10;
  }
  
  public Block(int speed, int angle){
    this.angle = angle;
    this.speed = speed;
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
    if (angle >= 360) {
      angle = angle % 360;
    }
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
 
  
  // increase the speed of the block depending on 
  public void accelerate(int num) {
    speed += num;
  }
}

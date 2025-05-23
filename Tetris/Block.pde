public class Block {
  private int angle;
  private int speed;
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
  public void move() {
    
  }
 
  
  // increase the speed of the block depending on 
  public void accelerate(int num) {
    speed += num;
  }
  
  public void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        // turn CW
        
      }
      else if (keyCode == DOWN) {
        // accelerate
        
      }
      else if (keyCode == LEFT) {
        // move left
        
      }
      else if (keyCode == RIGHT) {
        // move right
        
      }
    }
  }
}

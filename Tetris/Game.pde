import java.util.*;
public class Game{
  private int level;
  private int score;
  private int speedDelay;
  private int lastDrop;
  // all blocks on the screen
  //private ArrayList<Tetromino> blocks;
  // a 2D array of Blocks that keeps every block's position
  private Block[][] screen;
  
  // all types of 4-Block combinations
  private ArrayList<Tetromino> blockType;
  // blockType index for looping
  //private int index;
  // current Tetrimino
  private Tetromino currentBlock;
  private int rowsCleared;
  
  public Game(){
    this.level = 1;
    this.score = 0;
    speedDelay = 550;
    this.blockType = new ArrayList<Tetromino>();
    //this.index = 0;
    //blockSetup(); // ERROR
    lastDrop = 0;
    //this.blocks = new ArrayList<Tetromino>();
    //blocks.add(blockType.get(0));
    this.screen = new Block[20][10];
    
    this.currentBlock = blockType.get(0);
    this.rowsCleared = 0;
    blockSetup();
  }

  public int getLevel(){
    return level; 
  }
  
  public int getScore(){
     return score; 
  }
/*
  public int getSize(){
   return blocks.size(); 
  }
  public ArrayList<Tetromino> getBlockArray(){
    return blocks;
  }
 
  public Tetromino getBlockArray(int i){
   return blocks.get(i); 
  }
*/
 
  public Tetromino getCurr(){
   return currentBlock;
  }

  public Tetromino nextBlock(){
    level++;
    // increases speed
    for (int i = 0; i < getBlockArray().size(); i++) {
       getBlockArray(i).setSpeed(getBlockArray(i).getSpeed() + 3);
    }
    
    // randomizes block choice each time
    Collections.shuffle(blockType);
    Tetromino newBlock = blockType.get(index);
    index++;
    
    // resets index if it surpasses blockType length
    if (index >= blockType.size()) {
      index = 0;
    }
    
    blocks.add(blocks.get(0));
    blocks.set(0, newBlock);
    this.currentBlock = blocks.get(0);
    System.out.println(currentBlock.getSpeed());
    return newBlock;
  }
  
  public void blockSetup(){
    Block[] bI = new Block[4];
    for (int i = 0; i < 4; i++) {
      bI[i] = new Block(i*30+120,30);
    }
    blockType.add(new Tetromino(bI));
    
    Block[] bJ = new Block[4];
    bJ[0] = new Block(30 * 3 + 30, 30);
    bJ[1] = new Block(30 * 3 + 30, 60);
    bJ[2] = new Block(30 * 4 + 30, 60);
    bJ[3] = new Block(30 * 5 + 30, 60);
    blockType.add(new Tetromino(bJ));
    
    Block[] bL = new Block[4];
    bL[0] = new Block(30 * 5 +30, 30);
    bL[1] = new Block(30 * 3 + 30, 60);
    bL[2] = new Block(30 * 4 + 30, 60);
    bL[3] = new Block(30 * 5 + 30, 60);
    blockType.add(new Tetromino(bL));

    Block[] bO = new Block[4];
    bO[0] = new Block(30 * 4+30, 30);
    bO[1] = new Block(30*5+30,30);
    bO[2] = new Block(30 * 4 + 30,60);
    bO[3] = new Block(30 * 5 + 30, 60);
    blockType.add(new Tetromino(bO));
    
    Block[] bS = new Block[4];
    bS[0] = new Block(30 * 5 + 30, 30);
    bS[1] = new Block(30 * 6 + 30, 30);
    bS[2] = new Block(30* 4 + 30, 60);
    bS[3] = new Block(30 * 5 + 30, 60);   
    blockType.add(new Tetromino(bO));
    
    Block[] bT = new Block[4];
    bT[0] = new Block(30 * 4+30, 30);
    bT[1] = new Block(30*3+30,60);
    bT[2] = new Block(30 * 4 + 30,60);
    bT[3] = new Block(30 * 5 + 30, 60); 
    blockType.add(new Tetromino(bT));
    
    Block[] bZ = new Block[4];
    bZ[0] = new Block (30 * 4 + 30, 30);
    bZ[1] = new Block(30 * 5 + 30,30);
    bZ[2] = new Block(30 * 5 + 30, 60);
    bZ[3] = new Block(30 * 6 + 30, 60);
    blockType.add(new Tetromino(bZ));
  }
  
  public void spawnTetromino(){
    int index = (int) random(blockType.size());
    Tetromino block = blockType.get(index);
    Block[] blocks = new Block[4];
    for(int i = 0; i < 4; i++) {
       blocks[i] = new Block(block.getBlocks()[i].getX(), block.getBlocks()[i].getY());
    }
    currentBlock = new Tetromino(blocks);
  }
  
  
  public boolean clearRow(int row){
    if (rowsCleared == 10) {
      level++;
      rowsCleared = 0;
    }
    
    for (int r = 0; r < screen.length; r++) {
      for (int c = 0; c < screen[0].length; c++) {
        if (r == row) {
          // if you can clear the row
          // clear the row and move everything down
          score++;
          rowsCleared++;
          
          return true;
        }
      }
    }
    return false;
  }

  public void endGame(){
    background(0);
    fill(color(0));
    text("Game Over",125,315, 100);
    noLoop();
  }
}

import java.util.*;
public class Game{
  private int level;
  private int score;
  // all blocks on the screen
  private ArrayList<Tetromino> blocks;
  // a 2D array of Blocks that keeps every block's position
  private Block[][] screen;
  
  // all types of 4-Block combinations
  private ArrayList<Tetromino> blockType;
  // blockType index for looping
  private int index;
  // current Tetrimino
  private Tetromino currentBlock;
  private int rowsCleared;
  
  public Game(){
    this.level = 1;
    this.score = 0;
    
    this.blockType = new ArrayList<Tetromino>();
    this.index = 0;
    blockSetup();
    
    this.blocks = new ArrayList<Tetromino>();
    blocks.add(blockType.get(0));
    this.screen = new Block[20][10];
    
    this.currentBlock = blockType.get(0);
    this.rowsCleared = 0;
  }

  public int getLevel(){
    return level; 
  }
  
  public int getScore(){
     return score; 
  }

  public int getSize(){
   return blocks.size(); 
  }

  public ArrayList<Tetromino> getBlockArray(){
    return blocks;
  }
 
  public Tetromino getBlockArray(int i){
   return blocks.get(i); 
  }
  
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
    return newBlock;
  }
  
  public void blockSetup(){
    Block[][] newPile = new Block[1][4];
    for (int i = 0; i < 4; i++) {
      newPile[0][i] = new Block(i*30+120,30);
    }
    
    Tetromino bI = new Tetromino(newPile);
    blockType.add(bI);
    /*
    Tetromino bJ = new Block[4];
    
    Tetromino bL = new Block[4];
    
    Tetromino bO = new Block[4];
    
    Tetromino bS = new Block[4];
    
    Tetromino bT = new Block[4];
    
    Tetromino bZ = new Block[4];
    */
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
    fill(color(0));
    text("Game Over",125,315, 100);
    noLoop();
  }
}

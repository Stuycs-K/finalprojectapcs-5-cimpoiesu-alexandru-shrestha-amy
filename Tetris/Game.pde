import java.util.*;
public class Game{
  private int level;
  private int score;
  private ArrayList<Block[]> blocks; 
  private Block[][] screen;
  
  private ArrayList<Block[]> blockType;
  private int index;
  private Block[] currentBlock;
  //private Block[][][] blocks;
  private int rowsCleared;
  
  public Game(){
    this.level = 1;
    this.score = 0;
    
    this.blockType = new ArrayList<Block[]>();
    this.index = 1;
    blockSetup();
    
    this.blocks = new ArrayList<Block[]>();
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

  public ArrayList<Block[]> getBlocks(){
    return blocks;
  }
 
  public Block[] getBlocks(int i){
   return blocks.get(i); 
  }

  public Block[] nextBlock(){
    level++;
    // increases speed
    for (int i = 0; i < getBlocks().size(); i++) {
      for (int f = 0; f < 4; f++) {
        getBlocks(i)[f].setSpeed(getBlocks(i)[f].getSpeed() + 3);
      }
    }
    
    // randomizes block choice each time
    Collections.shuffle(blockType);
    Block[] newBlock = blockType.get(index);
    index++;
    
    // resets index if it surpasses blockType length
    if (index >= blockType.size()) {
      index = 0;
    }
    
    blocks.add(newBlock);
    this.currentBlock = newBlock;
    return newBlock;
  }
  
  public void blockSetup(){
    Block[] bI = new Block[4];
    for (int i = 0; i < bI.length; i++) {
      bI[i] = new Block(i*30+120,30);
    }
    blockType.add(bI);
    
    /*
    Block[] bJ = new Block[4];
    
    Block[] bL = new Block[4];
    
    Block[] bO = new Block[4];
    
    Block[] bS = new Block[4];
    
    Block[] bT = new Block[4];
    
    Block[] bZ = new Block[4];
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

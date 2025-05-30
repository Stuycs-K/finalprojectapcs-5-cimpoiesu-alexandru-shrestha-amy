public class Game{
  private int level;
  private int score;
  private ArrayList<Block[]> blocks; 
  private ArrayList<Block[]> blockType;
  //private Block[][][] blocks;
  private int rowsCleared;
  
  public Game(){
    this.level = 1;
    this.score = 0;
    this.blockType = new ArrayList<Block[]>();
    blockSetup();
    this.blocks = new ArrayList<Block[]>();
    blocks.add(blockType.get(0));
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
   return blocks.get(0); 
  }

  public Block nextBlock(){
    level++;
    
    return new Block();
  }
  
  public void blockSetup(){
    Block[] bI = new Block[4];
    for (int i = 0; i < bI.length; i++) {
      bI[i] = new Block(i*30+120,30);
    }
    blockType.add(bI);
    
    Block[] bJ = new Block[4];
    
    Block[] bL = new Block[4];
    
    Block[] bO = new Block[4];
    
    Block[] bS = new Block[4];
    
    Block[] bT = new Block[4];
    
    Block[] bZ = new Block[4];
  }

  public boolean clearRow(int row){
    return false;
  }

  public void endGame(){
    clear();
    text("Game Over",214,375);
  }
}

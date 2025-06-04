import java.util.*;
public class Game{
  private int level;
  private int score;
  private int speedDelay;
  /*private*/int lastDrop;
  // all blocks on the screen
  //private ArrayList<Tetromino> blocks;
  // a 2D array of Blocks that keeps every block's position
  //private Block[][] screen;
  public Block[][] screen;
  // all types of 4-Block combinations
  private ArrayList<Tetromino> blockType;
  // blockType index for looping
  //private int index;
  // current Tetrimino
  private Tetromino currentBlock;
  private int rowsCleared;
  private Tetromino nextBlock;
  
  public Game(){
    this.level = 1;
    this.score = 0;
    speedDelay = 550;
    this.blockType = new ArrayList<Tetromino>();
    //this.index = 0;
    
    lastDrop = 0;
    //this.blocks = new ArrayList<Tetromino>();
    //blocks.add(blockType.get(0));
    this.screen = new Block[20][10];
    blockSetup();
    this.currentBlock = blockType.get(0);
    this.rowsCleared = 0;
    this.nextBlock = blockType.get((int) random(blockType.size()));
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
 public Block[][] getScreen(){
    return screen; 
 }
  public Tetromino getCurr(){
   return currentBlock;
  }
/*
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
  */
    public void play(){
   for(int i = 0; i < 20; i++){
     for(int j = 0; j < 10; j++){
      if(screen[i][j] !=null){
        fill(screen[i][j].getColor());
        rect(30 +j * 30, 30 + i * 30, 30, 30);
        stroke(0);
        noFill();
        rect(30 +j * 30, 30 + i * 30, 30, 30);
        noStroke();
      }
     }
   }
    if(currentBlock != null){
      currentBlock.display();
    }
    
    stroke(5);
    // color of screen, etc.
    fill(64,20); // 2nd value opacity
    rect(30,30,300,600);
  
    // screen for nextBlock
    rect(360, 30, width-30-360, 180);
  
    // screen for text
    rect(360, 240, width-30-360, 90);
    line(360, 285, 550, 285);
    
    displayNext();
  
    // text for score + level
    fill(0);
    textSize(25);
    String levelStr = "LEVEL:     " + board.getLevel();
    text(levelStr, 380, 271);
    String scoreStr = "SCORE:    " + board.getScore();
    text(scoreStr, 380, 315);
  }

  public void blockSetup(){
    Block[] bI = new Block[4];
    for (int i = 0; i < 4; i++) {
      bI[i] = new Block(i*30+120,30, color(52, 235, 229));
    }
    blockType.add(new Tetromino(bI));
    Block[] bJ = new Block[4];
    bJ[0] = new Block(30 * 3 + 30, 30, color(24, 51, 222));
    bJ[1] = new Block(30 * 3 + 30, 60, color(24, 51, 222));
    bJ[2] = new Block(30 * 4 + 30, 60, color(24, 51, 222));
    bJ[3] = new Block(30 * 5 + 30, 60, color(24, 51, 222));
    blockType.add(new Tetromino(bJ));
    
    color L = color(255, 204, 0);
    Block[] bL = new Block[4];
    bL[0] = new Block(30 * 5 +30, 30, L);
    bL[1] = new Block(30 * 3 + 30, 60, L);
    bL[2] = new Block(30 * 4 + 30, 60, L);
    bL[3] = new Block(30 * 5 + 30, 60, L);
    blockType.add(new Tetromino(bL));

    color O = color(239, 245, 66);
    Block[] bO = new Block[4];
    bO[0] = new Block(30 * 4+30, 30, O);
    bO[1] = new Block(30*5+30,30, O);
    bO[2] = new Block(30 * 4 + 30,60, O);
    bO[3] = new Block(30 * 5 + 30, 60, O);
    blockType.add(new Tetromino(bO));
    
    color S = color(84, 245, 66);
    Block[] bS = new Block[4];
    bS[0] = new Block(30 * 5 + 30, 30, S);
    bS[1] = new Block(30 * 6 + 30, 30, S);
    bS[2] = new Block(30* 4 + 30, 60, S);
    bS[3] = new Block(30 * 5 + 30, 60, S);
    blockType.add(new Tetromino(bS));
    
    color T = color(245, 66, 242);
    Block[] bT = new Block[4];
    bT[0] = new Block(30 * 4+30, 30, T);
    bT[1] = new Block(30*3+30,60, T);
    bT[2] = new Block(30 * 4 + 30,60, T);
    bT[3] = new Block(30 * 5 + 30, 60, T); 
    blockType.add(new Tetromino(bT));
    
    color Z = color(245, 66, 66);
    Block[] bZ = new Block[4];
    bZ[0] = new Block (30 * 4 + 30, 30, Z);
    bZ[1] = new Block(30 * 5 + 30,30, Z);
    bZ[2] = new Block(30 * 5 + 30, 60, Z);
    bZ[3] = new Block(30 * 6 + 30, 60, Z);
    blockType.add(new Tetromino(bZ));
  }
  
  public void spawnTetromino(){
    //int index = (int) random(blockType.size());
    Tetromino block = nextBlock;
    Block[] blocks = new Block[4];
    for(int i = 0; i < 4; i++) {
       blocks[i] = new Block(block.getBlocks()[i].getX(), block.getBlocks()[i].getY(), block.getBlocks()[i].getColor());
    }
    currentBlock = new Tetromino(blocks);
    
    
    int index2 = (int) random(blockType.size());
    Tetromino block2 = blockType.get(index2);
    Block[] blocks2 = new Block[4];
    for(int i = 0; i < 4; i++) {
       blocks2[i] = new Block(block2.getBlocks()[i].getX(), block2.getBlocks()[i].getY(), block2.getBlocks()[i].getColor());
    }
    nextBlock = new Tetromino(blocks2);
  }
  
  public void displayNext() {
    Block[] blocks2 = nextBlock.getBlocks();
    Block[] shownBlocks = new Block[4];
    for(int i = 0; i < 4; i++) {
       shownBlocks[i] = new Block(blocks2[i].getX()+280,blocks2[i].getY() + 50,blocks2[i].getColor());
    }
    Tetromino shownBlock = new Tetromino(shownBlocks);
    shownBlock.display();
  }
  
  public void clearRow(){
    //if (rowsCleared == 10) {
      //level++;
      //rowsCleared = 0;
    //}
    
    for (int r = 19; r >= 0; r--) {
      boolean full = true;
      for (int c = 0; c < 10; c++) {
        if (screen[r][c]==null) {
          full = false;
          return;
        }
      }
    if(full){
       score += 100 * level;
       for(int i = r; i > 0; i--){
         for(int j = 0; j < 10; j++){
           screen[i][j] = screen[i-1][j];
           if(screen[i][j] != null){
               score++;
              screen[i][j].y += 30; // add a set y 
           }
         }
       }
       for(int col = 0; col < 10; col++){
          screen[0][col] = null; 
       }
       r++;
    }
  }
 }
 
 public void speedUp(){
   if (score != 0 && score % 10 == 0 && speedDelay > 50) {
     speedDelay -= 5;
   }
 }
 
  private boolean gameOver() {
    for (int i = 0; i < 10; i++) {
      if (screen[0][i] != null) {
        return true;
      }
    }
    return false;
  }
  
    public void update() {
    int currentMilli = millis();
    if (currentMilli - lastDrop > speedDelay) {
      if(!currentBlock.move(0,1,screen)) {
        currentBlock.atBottom(screen);
        clearRow();
        spawnTetromino();
        if(gameOver()){
         endGame();
         noLoop();
        }
      }
      lastDrop = currentMilli;
    }
  }

    
  public void endGame(){
    background(255, 0, 0, 50);
    fill(color(0));
    text("Game Over",125,315,100);
    noLoop();
  }
}

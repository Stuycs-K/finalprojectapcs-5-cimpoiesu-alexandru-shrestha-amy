public class Game {
  private int level;
private int score;
private ArrayList<Block> blocks;

public int getLevel(){
  return level; 
}

public int getScore(){
   return score; 
}

public ArrayList<Block> getBlocks(){
  return blocks;
}

public Block nextBlock(){
  return new Block();
}

public boolean clearRow(int row){
  return false;
}

public void endGame(){
  clear();
  text("Game Over",214,375);
}
}

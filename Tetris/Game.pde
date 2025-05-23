private int level;
private int score;
private ArrayList<Block> blocks;

public int getLevel(){
  return level; 
}

public int getScore(){
   return score; 
}

public void endGame(){
  clear();
  text("Game Over",214,375);
  
}

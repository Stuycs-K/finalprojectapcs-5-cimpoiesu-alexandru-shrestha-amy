
# Technical Details:
Period 5  
Tetrahedron  
We intend on creating tetris where you can rotate blocks, store blocks and so that you can see the upcoming block so you know whether you want to use the next block. There will be a pause menu and a startup menu that will allow you to organically move between games or pause it if you don’t want to play anymore. There will also be levels that ramp up in speed after you reach certain point thresholds and the level and blocks placed will also be displayed. Like tetris the blocks will be different colored and the row will end up disappearing if the row gets completely filled. There will also be only a limited amount of possible blocks that can be made and the order that they come will be randomly picked.  

The MVP will essentially be tetris but mainly focused on making sure the block class works correctly and it will be focused on their creation, randomization, and making sure that they move down and the row gets deleted when the row is full of them. Along with this there will still be all the variables like level and score since these are relatively simple to implement and will help make our prototype more fleshed out. Adding on, there will also be progression in levels since that doesn't change the code very much. Basically, it will be a barebones showcase of the block object and it will properly interact with the others to make sure that the general function of the game is working.  

Nice to have:
- Pause button
- restart button
- different colored blocks
- storing blocks/seeing next block
- text font/cool design
- expected fall template
- sound/music

We will be using Processing in order to easily visualize the game. We will be using keyPressed(), setup(), draw(), keyCode and various other labs to supplement the creation of this game. In addition, we will be utilizing our knowledge of classes, private/public instance variables, loops, etc. we learned in class to fully flesh out a working tetris game.
     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

Classes:
~
1. Block
- turn: allows block to turn right with the up arrow key
- randomBlock: generates a random tetris block with their specific color
- move: use left/right arrows keys to move
- accelerate: allows block to move down quicker using down arrow key

2. Game  
~- startGame: sets the game into motion, runs a loop to start blocks~
- nextBlock: shows a screen with the next block
- getLevel: returns the current level (increase by 1 each 10 rows cleared)
- getScore: returns the current score (increase by 1 each 1 row cleared)
- ~clearRow~ removeR: clears the row that is filled and adds one to score
- endGame: shows end game screen, possibly offering a restart option  
--> Possible code: use an ArrayList to keep track of the entire board. Fill entire board with 0. When a block is added, update board and increase the number of the board. Each block has a different number. When a row is filled (row[i][j] > 0) then we can clear the row by setting all numbers in the row equal to zero.~

1. Tetris
- setup: sets the game into motion, ~runs a loop to start blocks~ set size, background and print cheat text
- draw: continuously draw on the screen; updates ~whenever block moves~ block motion and actions on screen
- keyPressed: ~moves the current block in Game when keyPressed~ check for cheats; moves left/right/accelerate (down)/rotate (up) based on key
- mousePressed: checks for pause

2. Block
- display: shows block on screen
- getColor: returns color of block
- inBounds: checks if current tetris block is in bounds of screen
- getX: returns x position of block
- getY: returns y position of block
- getSize: returns height/width of block (since it's a square)

3. Game
- getLevel: returns the current level of the game
- getScore: returns the current score of the game
- getScreen: returns the 2-D block array that is the screen
- getCurr: return the current Tetromino that is falling
- play: runs the entire game loop, prints text and different screens (e.g. pause screen text, end game text)
- blockSetup: sets up the Arraylist of tetrominos, blockType, with the specific 7 types of blocks that exist in Tetris
- spawnTetromino: sets the nextBlock tetromino and replaces current one with next one
- displayNext: displays the next block in the next block corner
- clearRow: clears the row on screen that is full and moves the other blocks down, adding to the score if the row is cleared/full
- makeTetris: create a screen where there are 4 rows to be cleared
- speedUp: speeds ups the current block by decreasing speedDelay
- gameOver: checks if the top row of screen has blocks in it/the player reaches game over
- update: runs clearRow and spawnTetromino, moves the current block and updates the delay
- endGame: displays endGame screen and text
- cheatLevel: increase level if key is '1', decrease level if key is '2'
- pause: check if the game is paused
- getPause: return whether or not the game is paused 

4. Tetromino
- display: displays the Tetromino/each individual block in the Tetromino
- rotate: rotates the Tetromino clockwise by 90 degrees
- getBlocks: returns the Block array that make up the Tetromino
- getSpeed: return the delay of the blocks when they fall/speedDelay
- setSpeed: set speedDelay
- move: move the blocks in Tetromino
- inBounds: checks if x and y are in bounds of the block screen
- accelerate: decreases the speedDelay (min 1) and returns the number of times accelerate was run
- inBounds: checks if all blocks in current Tetromino are inBounds
- atBottom: checks if the Tetromino has reached the bottom of the screen

![Our tetris UML diagram with classes Block and Game.](https://github.com/Stuycs-K/finalprojectapcs-5-cimpoiesu-alexandru-shrestha-amy/blob/main/UML.png)
    
# Intended pacing:
_Alex_: responsible for coding half of the Block and Game classes (turn, accelerate, startGame, getLevel, endGame)

_Amy_: responsible for coding half of the Block and Game classes (randomBlock, move, nextBlock, getScore, clearRow)

## TIMELINE: 
**Thu, May 23** - complete prototype, begin working on Block class  
**Mon, May 26** - complete Block class, start Game class  
~Fri, May 30 - complete Game class, add additional features if extra time available~  
**Sun, June 1** - complete Game class with MVP  
**Sun, June 8** - add additional features/nice to have features, record final project video  

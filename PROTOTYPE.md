
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

We will be using Processing in order to easily visualize the game. We will be using keyPressed(), setup(), draw(), keyCode and various other labs to supplement the creation of this game. In addition, we will be utilizing our knowledge of classes, private/public instance variables, loops, etc. we learned in class to fully flesh out a working tetris game.
     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

Classes:
1. Block
- turn: allows block to turn right with the up arrow key
- randomBlock: generates a random tetris block with their specific color
- move: use left/right arrows keys to move
- accelerate: allows block to move down quicker using down arrow key

2. Game
- startGame: sets the game into motion, runs a loop to start blocks
- nextBlock: shows a screen with the next block
- getLevel: returns the current level (increase by 1 each 10 rows cleared)
- getScore: returns the current score (increase by 1 each 1 row cleared)
- clearRow: clears the row that is filled and adds one to score
- endGame: shows end game screen, possibly offering a restart option  
--> Possible code: use an ArrayList to keep track of the entire board. Fill entire board with 0. When a block is added, update board and increase the number of the board. Each block has a different number. When a row is filled (row[i][j] > 0) then we can clear the row by setting all numbers in the row equal to zero.

![Our tetris UML diagram with classes Block and Game.](https://github.com/Stuycs-K/finalprojectapcs-5-cimpoiesu-alexandru-shrestha-amy/blob/main/Start.png)
    
# Intended pacing:
_Alex_: responsible for coding half of the Block and Game classes (turn, accelerate, startGame, getLevel, endGame)

_Amy_: responsible for coding half of the Block and Game classes (randomBlock, move, nextBlock, getScore, clearRow)

## TIMELINE: 
**Thu, May 23** - complete prototype, begin working on Block class  
**Mon, May 26** - complete Block class, start Game class  
**Fri, May 30** - complete Game class, add additional features if extra time available  
**Sun, June 1** - record final project video

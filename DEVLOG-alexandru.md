# Dev Log:

This document must be updated daily every time you finish a work session.

## Alexandru Cimpoiesu!

### 2025-05-16 - Wrote Proposals
Wrote the proposals for Tetris, chess and solitaire, writing descriptions for them and putting links to websites we would be modeling our designs off of. (40 minutes)
### 2025-05-19 - Prototype Documentation
Wrote the MVP for tetris, the project description for it and wrote the features that would be nice to have for our project. (40 minutes)
### 2025-05-22 - Created Tetris and Block Classes
Reviewed the UML's creation and then created the Tetris class and the Block class with constructors to make objects. (40 minutes)
### 2025-05-23 - Began working on Game Class with accessors
Made the Game class with instance variables like level, score, and blocks array, then made endGame and setup. (40 minutes)
### 2025-05-27 - Fixed syntax errors and variable calls
Made move take inputs of x and y so it could work with all directions, made new accessors of size and getBlocks, made keypressed use the getBlocks method and updated move. Also added text to display score. (40 minutes).
### 2025-05-28 - Worked on keeping blocks in bounds
Kept updating the inBounds method and the acceleration methods (would go out of bounds when accelerating) (40 minutes).
### 2025-05-29 - Worked on acceleration
Added new accessors to each block and added a set speed to keep it from accelerating out of bounds(didn't work)(40 minutes).
### 2025-05-30 - Fixed acceleration
Added the checks for deceleration inside of the draw method which finally ended up fixing the problem (40 minutes).
### 2025-06-02 - Created Tetrominos
Added all the types of tetrominos (I,J etc) and commented out all of the code that was redundant in the block class that would instead be used in the new tetromino class. (1 hour 15 minutes).
### 2025-06-03 - Game loop
Made tetrominos combatible with being added to an array, added spawntetromino, fixed inBounds for tetromino, made rows clear, added move to Tetrominos, made the blocks constant sizes, remade draw method to correctly display Tetrominos without duplicates appearing, also ended up adding rotations to tetrominos (which I forgot to push on that day). (2 hours 30 minutes).
### 2025-06-04 - Colored Tetrominos
Added a color attribute to blocks which made it so that each Tetromino can have their own, distinct color. Fixed it from changing to a gray color once it would reach the bottom (I block is blue etc). (40 minutes).
### 2025-06-06 - NextBlock out of bounds
Fixed NextBlock going out of its box (being able to move when it should be frozen) (40 minutes).
### 2025-06-08 - Bug fixing
Fixed a stack overflow error while spawning the tetrominos and also made a bug fix with clearing rows that made clear rows for multiple at once work everytime (it was inconsistent earlier). Also made it so that you can't rotate the O block and also added a button so you can restart the game. (2 hours 40 minutes)

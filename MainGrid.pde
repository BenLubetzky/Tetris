//main grid class, where the player plays the game

class MainGrid{
 
  //grid initialization variables
  float widthBlock;
  float heightBlock;
  int r;
  int c;
  
  //visual grid
  Block [][]grid;
  
  //current shape
  Shape s;
  
  //theoretical matrix, it keeps track of where things are
  int [][]tMatrix;
  int score;
  SecondaryGrid showcase;
  
  MainGrid(float startX, float startY, int rows, int cols, float gridWidth, float gridHeight, SecondaryGrid ss){
    widthBlock = gridWidth / cols;
    heightBlock = gridHeight / rows;
    
    //initialize score to 0 at start
    score = 0;
    
    r = rows;
    c = cols;
    grid = new Block[rows][cols];
    tMatrix = new int[rows + 1][cols];
    showcase = ss;
    
    //padding the tMatrix with 1 with 'hypothetical' blocks
    for(int j = 0; j < cols; j++){
     tMatrix[rows][j] = 1; 
    }
    
    //updating the blocks, by default color, override later on
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < cols; j++){
       grid[i][j] = new Block(heightBlock, widthBlock, i, j, startX + j * widthBlock, startY + i * heightBlock); 
      }
    }
    
    //making a new block
    s = new Shape();
    for(int i = 0; i < 4; i++){
     for(int j = 4; j < 4; j++){
      //check if there is a block there, update color if necessary
      if(s.shape[i][j] == 1){
       grid[i][s.c + j].updateColor(s.red, s.green, s.blue); 
      }
      
     }
    }
    
  }
  
  //returns true if game is over
  boolean drawGrid(){
    
    //check if shape hit anything, if not update position
    if(!checkHit()){
       updateForShape();
       for(int i = 0; i < r; i++){
        for(int j = 0; j < c; j++){
          grid[i][j].drawBlock(); 
        }
       }  
       return false;
     }
     //in case there was a hit, check if end of game, or if a line can be removed
     else{
       //checking if game is over
        if (checkEndGame()){
         //game ended, reset score, reset board
         resetBoard();
         showcase.updateShape();
         showcase.drawMe();
         score = 0;
         return true;
        }
        //checking if lines can be removed
        else if(foundRemovableLines()){
          updateBoardNewLines();
          return false;
        }
      }
      return false;
  }
  
  //in case of removable lines, use the theoretical matrix to update the visual grid 
  void updateBoardNewLines(){
   int []fullLines = new int[r];
   int summ, scoreThing = 0;
   int tMatrixIndex = r - 1;
   int [][]tMatrixCpy = new int[r][c];
   
   //marking the lines that are not going to be copied
   for(int i = 0; i < r; i++){
     summ = 0;
     
   for(int j = 0; j < c; j++){
      if (tMatrix[i][j] == 1){
       summ++; 
      }
    }
    
    //checking the number of occupied blocks in a row, if equal to the number of total blocks in the row, row is occupied
    if(summ == c){
      scoreThing++;
     fullLines[i] = 1;
    }
   }
   
   //scoring system
   if(scoreThing == 1){
    score += 100; 
   }
   else if(scoreThing == 2){
    score += 300; 
   }
   else if(scoreThing == 3){
    score += 500; 
   }
   else{
    score += 800; 
   }
 
   
   //update tMatrix
   for(int i = r - 1; i > -1; i--){
    //checking if it's not a full line
    //println("i",i);
    if(fullLines[i] == 0){
     for(int j = 0; j < c; j++){
      tMatrixCpy[tMatrixIndex][j] = tMatrix[i][j];
      grid[tMatrixIndex][j].updateColor(grid[i][j].rgb[0], grid[i][j].rgb[1], grid[i][j].rgb[2]);
     }
     tMatrixIndex--;
    }
   }
   
   //update tMatrix to the updated tMatrix 
   for(int i = 0; i < r; i++){
    for(int j = 0; j < c; j++){
     tMatrix[i][j] = tMatrixCpy[i][j];
    }
   }

  }
  
  //helper function for finding removable lines
  boolean foundRemovableLines(){
    int summ;
    for(int i = 0; i < r; i++){
      summ = 0;
      for(int j = 0; j < c; j++){
       if (tMatrix[i][j] == 1){
        summ++; 
       }
      }
      if(summ == c){
       return true; 
      }
    }
    return false;
  }
  
  //function for reseting the board, used when game is over
  void resetBoard(){
   //reset tMatrix and main board
   for(int i = 0; i < r; i++){
    for(int j = 0; j < c; j++){
      tMatrix[i][j] = 0;
      grid[i][j].updateColor(50,50,50);
    }
   }
  }
  
  //check for the end of the game according to if a block passed a certain height
  boolean checkEndGame(){
    for(int j = 0; j < c;j++){
      if(tMatrix[2][j] == 1){
        return true;
      }
    }
    return false;
  }
 
  //updating the visual grid according to where shape is
  void updateForShape(){

    //turn everything into gray
    for(int i = 0; i < 4; i++){
     for(int j = 0; j < 4; j++){
       if(s.shape[i][j] == 1 && s.r + i - 1 > -1){
         //check for my special move, use tMatrix to verify that we are not deleting anything on top
         if(tMatrix[s.r + i - 1][s.c + j] != 1){
          grid[s.r + i - 1][s.c + j].updateColor(50, 50, 50);
         }
       }
     }
    }
    
    //turn it back on where needed
    for(int i = 0; i < 4; i++){
     for(int j = 0; j < 4; j++){
      if(s.shape[i][j] == 1){
       grid[s.r + i][s.c + j].updateColor(s.red, s.green, s.blue);
      }
     }
    }
    
  }
  
  //helper function for moving down shape
  void moveDownShape(){
   s.r++;
  }
  
  //helper function for checking for a hit
  boolean checkHit(){        

    //checking for approximating intersection
    for(int i = 0; i < 4; i++){
     for(int j = 0; j < 4; j++){
      if (s.shape[i][j] == 1){

        //check for intersection with tMatrix
        if(tMatrix[s.r + i][s.c + j] == 1){
          updateTheoreticalMatrix();
          //s = new Shape();
          s = new Shape(showcase.shapeFigure);

          showcase.updateShape();
          showcase.drawMe();
          return true;
        }
      }
     }
    }
   
   return false;
  }
  
  //updating the theoretical matrix to fit shape's new position
  void updateTheoreticalMatrix(){
    for(int i = 0; i < 4; i++){
     for(int j = 0; j < 4; j++){
      if(s.shape[i][j] == 1){
       tMatrix[s.r + i - 1][s.c + j] = 1; 
      }
     }
    }
   
  }
   
  //helper function that checks if possible to move shape right
  void moveShapeRight(){
     //check if possible to move right
    if(checkIfPossibleMoveRight()){ 
      updateShapeBackground();
      s.c++;
      drawGrid();
    }
  }
  
  //helper function that checks if possible to move the shape to the right
  boolean checkIfPossibleMoveRight(){
    for(int i = 0;i < 4; i++){
     for(int j = 0; j < 4; j++){
      if(s.shape[i][j] == 1){
       //checking limits on right
       if (s.c + j + 1 >= c){
         return false;
       }
       if(tMatrix[s.r + i][s.c + j + 1] == 1){
        return false; 
       }
      }
     }
    }
   
   return true;
  }
  
  //helper function for updating the visual grid
  void updateShapeBackground(){
    //color everything into gray where it was
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        //println("checking " + i + " " + j);
       if(s.shape[i][j] == 1){
          grid[s.r + i][s.c + j].updateColor(50, 50, 50);
       }
      }
    }
  }
    
  //helper function for moving the shape left
  void moveShapeLeft(){
     //check if possibel to move left, change this code later, add padding and check intersection
    if(s.c > 0 && !checkIntersectionLeft()){
     //if right side of matrix that represents side is all 0's, we're able to move
     updateShapeBackground();
     //colorShapeLeft();
     s.c--;
     drawGrid();
    }
  }
  
  //helper function that checks if possible to go left
  boolean checkIntersectionLeft(){
   for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
     if(s.shape[i][j] == 1){
      if(tMatrix[s.r + i][s.c + j - 1] == 1){
        return true;
      }
     }
    }
   }
   return false;
  }
    
  //helper function for updating the color when going left
  void colorShapeLeft(){
    for(int i = 0; i < 4;i++){
     for(int j = 0; j < 4; j++){
       if(s.shape[i][j] == 1){
        grid[i + s.r][j + s.c - 1].updateColor(s.red, s.green, s.blue); 
       }
     }
    }
  }
  
  //checking if possible to press up and change shape mode
  void shapeChangePositionRight(){
   
    int [][]tModel = s.shapePressedUpTheoretical();
    
    if (!isThereIntersection(tModel)){
      //paint everything gray
      updateShapeBackground();
      updateShapeModel(tModel);
      drawGrid();
    }

    
  }
  
  //checking for intersection using theoretical matrix
  boolean isThereIntersection(int [][]tModel){
   for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
      if(tModel[i][j] == 1){
        //check limits, RIGHT LIMIT
        if(s.c + j >= c){
         return true;
        }
        //bottom limit
        if(s.r + i >= r){
         return true;
        }
        
        //check intersection with tMatrix
        if(tMatrix[s.r + i][s.c + j] == 1){
         return true;
        }
        
      }
    }
   }
   return false;
  }
  
  //updating the shape if pressed up
  void updateShapeModel(int [][]tModel){
   for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
     s.shape[i][j] = tModel[i][j]; 
    }
   }
   s.shapeMode = (s.shapeMode + 1) % 4;
  }
  
  //cheat function
  void makeB(){
   score += 1000; 
  }
  
}

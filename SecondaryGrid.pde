//class responsible for the grid that shows the next shape

class SecondaryGrid{
 
  float x;
  float y;
  Shape s;
  int shapeFigure;
  Block [][] grid;
  
  int gridCols;
  int gridRows;
  
  float blockWidth;
  float blockHeight;
  
  SecondaryGrid(float absX, float absY, float gridWidth, float gridHeight){
    x = absX;
    y = absY;
    grid = new Block[6][6];

    blockWidth = gridWidth / 6;
    blockHeight = gridHeight / 6;
    
    
    //initialize the grid to be gray
    for(int i = 0; i < 6; i++){
      for(int j = 0; j < 6; j++){
       //   Block(float bH, float bW, float xPoss, float yPoss, float xAbss, float yAbss){
       grid[i][j] = new Block(blockHeight, blockWidth, i, j, absX + blockWidth * j, absY + blockHeight * i);
       grid[i][j].updateColor(50, 50, 50); 
      }
    }
    
    updateShape();
    
  }
  
  //function for updating the shape in the grid, taking into account optimal positioning in the grid to look nice
  //using row offset and column offset for top left
  void updateShape(){
   s = new Shape(); 
   shapeFigure = s.figure;

   
   for(int i = 0; i < 6; i++){
     for(int j = 0; j < 6; j++){
       grid[i][j].updateColor(50, 50, 50); 
      }
    }
    int rOffset = 0;
    int cOffset = 0;
     if(s.figure == 0){
      rOffset = 2;
      cOffset = 1;
    }
    if(s.figure == 1){
      s.updateShapeMode(3);
      rOffset = 1;
      cOffset = 2;
    }
    if(s.figure == 2){
      s.updateShapeMode(1);
      cOffset = 2;
      rOffset = 1;
    }
    if(s.figure == 3){
      rOffset = 2;
      cOffset = 2;
    }
    if(s.figure == 4){
      s.updateShapeMode(1);
      cOffset = 2;
      rOffset = 1;
    }
    if(s.figure == 5){
      s.updateShapeMode(3);
      rOffset = 1;
      cOffset = 2;
    }
    if(s.figure == 6){
      s.updateShapeMode(1);
      rOffset = 1;
      cOffset = 2;
    }
   
    //paint everything according to shape
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        if (s.shape[i][j] == 1){
          grid[i + rOffset][j + cOffset].updateColor(s.red, s.green, s.blue); 
        }
      }
    }
  }
  
  //helper function for drawing block
  void drawMe(){
    for(int i = 0; i < 6; i++){
     for(int j = 0; j < 6; j++){
      grid[i][j].drawBlock(); 
     }
    }
  }
  
}

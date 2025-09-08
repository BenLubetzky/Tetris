//class for shape, shape can be described as a 4x4 matrix of 0's and 1's with a uniform color 

class Shape{
 
  int red;
  int blue;
  int green;
  int [][]shape;
  float x;
  float y;
  
  int figure;
  
  int shapeMode = 0;
  
  int r;
  int c;
  
  //7 shapes 0 - 6
  
  Shape(){
    shape = new int[4][4];
    
    x = width / 2;
    y = 0;
    
    r = 0;
    c = 3;
    
    //figuring out which number
    figure = round(random(6));
    
    //
    // ####
    if(figure == 0){
      red = 19;
      green = 203;
      blue = 207;
      
      shape[0][0] = 1;
      shape[0][1] = 1;
      shape[0][2] = 1;
      shape[0][3] = 1;
    }
    
    //#
    //###
    if(figure == 1){
      red = 19;
      green = 56;
      blue = 207;
      
      shape[0][0] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
    
    //  #
    //###
    if(figure == 2){
      red = 247;
      green = 174;
      blue = 15;
      
      shape[0][2] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
    
    //##
    //##
    if(figure == 3){
      red = 247;
      green = 232;
      blue = 15;
      c++;
      
      shape[0][0] = 1; 
      shape[0][1] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
    }
    
    // ##
    //##
    if(figure == 4){
      red = 15;
      green = 247;
      blue = 15;
      
      shape[0][1] = 1;
      shape[0][2] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
    }
    
    // #
    //###
    if(figure == 5){
      red = 158;
      green = 15;
      blue = 247;
      
      shape[0][1] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
    
    //##
    // ##
    if(figure == 6){
      red = 247;
      green = 15;
      blue = 26;
      
      shape[0][0] = 1;
      shape[0][1] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
  }
  
  //second constructor, constructs a shape of a given figure
  Shape(int f){
    shape = new int[4][4];
    
    x = width / 2;
    y = 0;
    
    r = 0;
    c = 3;
    
    //figuring out which number
    
    //
    // ####
    figure = f;
    if(f == 0){
      red = 19;
      green = 203;
      blue = 207;
      
      shape[0][0] = 1;
      shape[0][1] = 1;
      shape[0][2] = 1;
      shape[0][3] = 1;
    }
    
    //#
    //###
    if(f == 1){
      red = 19;
      green = 56;
      blue = 207;
      
      shape[0][0] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
    
    //  #
    //###
    if(f == 2){
      red = 247;
      green = 174;
      blue = 15;
      
      shape[0][2] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
    
    //##
    //##
    if(f == 3){
      red = 247;
      green = 232;
      blue = 15;
      c++;
      
      shape[0][0] = 1; 
      shape[0][1] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
    }
    
    // ##
    //##
    if(f == 4){
      red = 15;
      green = 247;
      blue = 15;
      
      shape[0][1] = 1;
      shape[0][2] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
    }
    
    // #
    //###
    if(f == 5){
      red = 158;
      green = 15;
      blue = 247;
      
      shape[0][1] = 1;
      shape[1][0] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
    
    //##
    // ##
    if(f == 6){
      red = 247;
      green = 15;
      blue = 26;
      
      shape[0][0] = 1;
      shape[0][1] = 1;
      shape[1][1] = 1;
      shape[1][2] = 1;
    }
  }
  
  void updateShapeMode(int newShapeMode){
    
    //reset shape
    for(int i = 0; i < 4;i++){
     for(int j = 0; j < 4;j++){
      shape[i][j] = 0; 
     }
    }
    
    if(figure == 0){
      
      if(newShapeMode == 0){
        shape[0][0] = 1;
        shape[0][1] = 1;
        shape[0][2] = 1;
        shape[0][3] = 1;
      }
      if(newShapeMode == 1){
        shape[0][0] = 1;
        shape[1][0] = 1;
        shape[2][0] = 1;
        shape[3][0] = 1;
      }
      if(newShapeMode == 2){
        shape[0][0] = 1;
        shape[0][1] = 1;
        shape[0][2] = 1;
        shape[0][3] = 1;
      }
      if(newShapeMode == 3){
        shape[0][0] = 1;
        shape[1][0] = 1;
        shape[2][0] = 1;
        shape[3][0] = 1;
      }
    }
    
    //FIGURE 1
    if(figure == 1){
      
      if(newShapeMode == 0){
        shape[0][0] = 1;
        shape[1][0] = 1;
        shape[1][1] = 1;
        shape[1][2] = 1;
      }
      if(newShapeMode == 1){
        shape[0][0] = 1;
        shape[0][1] = 1;
        shape[1][0] = 1;
        shape[2][0] = 1;
      }
      if(newShapeMode == 2){
        shape[0][0] = 1;
        shape[0][1] = 1;
        shape[0][2] = 1;
        shape[1][2] = 1;
      }
      if(newShapeMode == 3){
        shape[2][0] = 1;
        shape[2][1] = 1;
        shape[1][1] = 1;
        shape[0][1] = 1;
      }
    }
    
    //FIGURE 2
    if(figure == 2){
      
      if(newShapeMode == 0){
        shape[0][2] = 1;
        shape[1][0] = 1;
        shape[1][1] = 1;
        shape[1][2] = 1;
      }
      if(newShapeMode == 1){
        shape[0][0] = 1;
        shape[1][0] = 1;
        shape[2][0] = 1;
        shape[2][1] = 1;
      }
      if(newShapeMode == 2){
        shape[0][0] = 1;
        shape[1][0] = 1;
        shape[0][1] = 1;
        shape[0][2] = 1;
      }
      if(newShapeMode == 3){
        shape[0][0] = 1;
        shape[0][1] = 1;
        shape[1][1] = 1;
        shape[2][1] = 1;
      }
    }
    
    //FIGURE 4
    if(figure == 4){
      
      if(newShapeMode == 0 || newShapeMode == 2){
        shape[0][1] = 1;
        shape[0][2] = 1;
        shape[1][0] = 1;
        shape[1][1] = 1;
      }
      if(newShapeMode == 1 || newShapeMode == 3){
        shape[0][0] = 1;
        shape[1][0] = 1;
        shape[1][1] = 1;
        shape[2][1] = 1;
      }
    }
    
    //FIGURE 5
    if(figure == 5){
      
      if(newShapeMode == 0){
        shape[0][1] = 1;
        shape[1][0] = 1;
        shape[1][1] = 1;
        shape[1][2] = 1;
      }
      if(newShapeMode == 1){
        shape[0][0] = 1;
        shape[1][0] = 1;
        shape[2][0] = 1;
        shape[1][1] = 1;
      }
      if(newShapeMode == 2){
        shape[0][0] = 1;
        shape[0][1] = 1;
        shape[0][2] = 1;
        shape[1][1] = 1;
      }
      if(newShapeMode == 3){
        shape[1][0] = 1;
        shape[0][1] = 1;
        shape[1][1] = 1;
        shape[2][1] = 1;
      }
    }
    
    //FIGURE 6
    if(figure == 6){
      
      if(newShapeMode == 0 || newShapeMode == 2){
        shape[0][0] = 1;
        shape[0][1] = 1;
        shape[1][1] = 1;
        shape[1][2] = 1;
      }
      if(newShapeMode == 1 || newShapeMode == 3){
        shape[0][1] = 1;
        shape[1][0] = 1;
        shape[1][1] = 1;
        shape[2][0] = 1;
      }
    }
  }
  
  //if you pressed up, what would the new 4x4 matrix that represents the shape would look like
  int[][] shapePressedUpTheoretical(){
    int updatedTheoreticalShapeMode = (shapeMode + 1) % 4;
    
    int [][] m = new int[4][4];
    
    //FIGURE 0
    if(figure == 0){
      
      if(updatedTheoreticalShapeMode == 0){
        m[0][0] = 1;
        m[0][1] = 1;
        m[0][2] = 1;
        m[0][3] = 1;
      }
      if(updatedTheoreticalShapeMode == 1){
        m[0][0] = 1;
        m[1][0] = 1;
        m[2][0] = 1;
        m[3][0] = 1;
      }
      if(updatedTheoreticalShapeMode == 2){
        m[0][0] = 1;
        m[0][1] = 1;
        m[0][2] = 1;
        m[0][3] = 1;
      }
      if(updatedTheoreticalShapeMode == 3){
        m[0][0] = 1;
        m[1][0] = 1;
        m[2][0] = 1;
        m[3][0] = 1;
      }
    }
    
    //FIGURE 1
    if(figure == 1){
      
      if(updatedTheoreticalShapeMode == 0){
        m[0][0] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
        m[1][2] = 1;
      }
      if(updatedTheoreticalShapeMode == 1){
        m[0][0] = 1;
        m[0][1] = 1;
        m[1][0] = 1;
        m[2][0] = 1;
      }
      if(updatedTheoreticalShapeMode == 2){
        m[0][0] = 1;
        m[0][1] = 1;
        m[0][2] = 1;
        m[1][2] = 1;
      }
      if(updatedTheoreticalShapeMode == 3){
        m[2][0] = 1;
        m[2][1] = 1;
        m[1][1] = 1;
        m[0][1] = 1;
      }
    }
    
    //FIGURE 2
    if(figure == 2){
      
      if(updatedTheoreticalShapeMode == 0){
        m[0][2] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
        m[1][2] = 1;
      }
      if(updatedTheoreticalShapeMode == 1){
        m[0][0] = 1;
        m[1][0] = 1;
        m[2][0] = 1;
        m[2][1] = 1;
      }
      if(updatedTheoreticalShapeMode == 2){
        m[0][0] = 1;
        m[1][0] = 1;
        m[0][1] = 1;
        m[0][2] = 1;
      }
      if(updatedTheoreticalShapeMode == 3){
        m[0][0] = 1;
        m[0][1] = 1;
        m[1][1] = 1;
        m[2][1] = 1;
      }
    }
    
    //FIGURE 3 - REQUIRES NO CHANGE, CONSTANT
    if(figure == 3){
     m[0][0] = 1;
     m[0][1] = 1;
     m[1][0] = 1;
     m[1][1] = 1;
    }
    
    //FIGURE 4
    if(figure == 4){
      
      if(updatedTheoreticalShapeMode == 0){
        m[0][1] = 1;
        m[0][2] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
      }
      if(updatedTheoreticalShapeMode == 1){
        m[0][0] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
        m[2][1] = 1;
      }
      if(updatedTheoreticalShapeMode == 2){
        m[0][1] = 1;
        m[0][2] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
      }
      if(updatedTheoreticalShapeMode == 3){
        m[0][0] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
        m[2][1] = 1;
      }
    }
    
    //FIGURE 5
    if(figure == 5){
      
      if(updatedTheoreticalShapeMode == 0){
        m[0][1] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
        m[1][2] = 1;
      }
      if(updatedTheoreticalShapeMode == 1){
        m[0][0] = 1;
        m[1][0] = 1;
        m[2][0] = 1;
        m[1][1] = 1;
      }
      if(updatedTheoreticalShapeMode == 2){
        m[0][0] = 1;
        m[0][1] = 1;
        m[0][2] = 1;
        m[1][1] = 1;
      }
      if(updatedTheoreticalShapeMode == 3){
        m[1][0] = 1;
        m[0][1] = 1;
        m[1][1] = 1;
        m[2][1] = 1;
      }
    }
    
    //FIGURE 6
    if(figure == 6){
      
      if(updatedTheoreticalShapeMode == 0){
        m[0][0] = 1;
        m[0][1] = 1;
        m[1][1] = 1;
        m[1][2] = 1;
      }
      if(updatedTheoreticalShapeMode == 1){
        m[0][1] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
        m[2][0] = 1;
      }
      if(updatedTheoreticalShapeMode == 2){
        m[0][0] = 1;
        m[0][1] = 1;
        m[1][1] = 1;
        m[1][2] = 1;
      }
      if(updatedTheoreticalShapeMode == 3){
        m[0][1] = 1;
        m[1][0] = 1;
        m[1][1] = 1;
        m[2][0] = 1;
      }
    }
    
    return m;
  }
  
}

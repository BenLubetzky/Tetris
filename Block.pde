class Block{
 
   float blockHeight;
   float blockWidth;
   
   //relative to the grid where it's at
   float r;
   float c;
   
   //absolute, relative to the screen
   float absX;
   float absY;
   
   int []rgb = {50, 50, 50};
   
   
   Block(float bH, float bW, float xPoss, float yPoss, float xAbss, float yAbss){
      blockHeight = bH;
      blockWidth = bW;
      r = xPoss;
      c = yPoss;
      absX = xAbss;
      absY = yAbss;
   }
   
   void drawBlock(){
     fill(rgb[0], rgb[1], rgb[2]);
     stroke(0);
     rect(absX, absY, blockWidth, blockHeight);
     //different from a gray block
     if (rgb[0] != 50 && rgb[1] != 50 && rgb[2] != 50){
       stroke(255);
       //topleft
       stroke(0);
       line(absX, absY, absX + blockWidth * 0.2, absY + blockHeight * 0.2);
       //top right
       line(absX + blockWidth, absY, absX + blockWidth * 0.8, absY + blockHeight * 0.2);
       //top left to top right
       line(absX + blockWidth * 0.2, absY + blockHeight * 0.2, absX + 0.8 * blockWidth, absY + blockHeight * 0.2);
       //bottom left
       line(absX, absY + blockHeight, absX + blockWidth * 0.2, absY + blockHeight * 0.8);
       //bottom left to top left
       line(absX + blockWidth * 0.2, absY + blockHeight * 0.8, absX + blockWidth * 0.2, absY + 0.2 * blockHeight);
       //bottom right
       line(absX + blockWidth, absY + blockHeight, absX + blockWidth * 0.8, absY + 0.8 * blockHeight);
       //bottom right to bottom left
       line(absX + blockWidth * 0.2, absY + blockHeight * 0.8, absX + blockWidth * 0.8, absY + blockHeight * 0.8);
       //bottom right to top right
       line(absX + 0.8 * blockWidth, absY + 0.8 * blockHeight, absX + 0.8 * blockWidth, absY + blockHeight * 0.2);
     }
   }
   
   void updateColor(int red, int green, int blue){
     rgb[0] = red;
     rgb[1] = green;
     rgb[2] = blue;
   }
  
}

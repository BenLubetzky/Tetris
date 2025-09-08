//Old version of Tetris game, pretty cool in my opinion

//the grid where the player plays
MainGrid grid;

//the grid where the next shape is shown
SecondaryGrid showcase;
boolean isShapeOnScreen = false;

//the current shape
Shape s;

//responsible for the time it takes for a shape to fall down, added acceleration to make it more real
int timeRest = 40;
int reduceTimeInterval = 700;
int count = timeRest;

//keeping track of the score
int score;


//setting up the initial stuff, nothing too crazy
void setup(){
  size(1000, 700);
  background(0);
  showcase = new SecondaryGrid(700, 50, 200, 200);
  grid = new MainGrid(50, 0, 20, 10, 500, height, showcase);  
  showcase.drawMe();
  grid.drawGrid();
}

void draw(){
 fill(100);
 rect(700, 450, 200, 65, 48);
 textSize(60);
 fill(255);
 text("Score", 730, 400);
 textSize(40);
 text(score, 740, 495);
 
 //moving shape down according to count 
 count--;
 if(count == 0){
  grid.moveDownShape();
  if(grid.drawGrid()){
   timeRest = 40; 
  }
  count = timeRest;
 }
 
 //acceleration, reducing timeRest for smaller reset
 reduceTimeInterval--;
 if(reduceTimeInterval == 0 && timeRest > 30){
   timeRest -= 0.1;
   reduceTimeInterval = 500;
 }
 
 //upading score
 score = grid.score;
 
}

void keyPressed(){
 //checking if the key is coded
 if(key == CODED){
   
   //LEFT
   if(keyCode == LEFT){
    //println("pressed left");
    grid.moveShapeLeft();
   }
   
   //RIGHT
   if(keyCode == RIGHT){
     //println("pressed right");
    grid.moveShapeRight();
   }
   
   //DOWN
   if(keyCode == DOWN){
    //println("pressed down");
    grid.moveDownShape();
    grid.drawGrid();
    count = timeRest;
   }
   
   //UP
   if(keyCode == UP){
     //println("pressed up");
     grid.shapeChangePositionRight();
   }
   
   //cheat code, press ALT get 1000 points, press when nobody's watching
   if(keyCode == ALT){
     grid.makeB();
   }
   
 } //<>//
}

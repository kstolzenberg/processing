//grids and 2d array sandbox
//make sure array can access the cols/rows!

void setup(){
  size(600,600);
  noLoop();
}

void draw(){
  int w = 20;
  int cols = (width/w);
  int rows = (height/w);
  int [][] board = new int[cols][rows];
  
  for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
      board[i][j] = int(random(255));
    }
  }
  
 for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
      fill(board[i][j]);
      rect(i*20,j*20,20,20);
    }
  } 

}

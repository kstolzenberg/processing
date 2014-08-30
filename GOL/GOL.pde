int i,j,x,y;
int w = 10;
int columns = 50;
int rows = 50;
//where 1 = alive and black

void setup(){
size(500,500);
background(255);
strokeWeight(1);
stroke(1);
smooth();
}

void draw(){
int [][] board = new int [columns][rows];

for (int x = 0; y< columns; x++ ){
  for(int y = 0; y<rows; y++){
    board[x][y] = int (random(2));
  }
}

int [][] next = new int[columns][rows];
for(int x=1; x<columns-1; x++){
  for (int y=1; y<rows-1;y++){
    int neighbors = 0;
    for (int i=-1; i<=1; i++){
      for (int j = -1; j<= 1; j++){
        neighbors += board[x+i][y+j];
      }
    }   
  neighbors -= board[x][y];
  if ((board[x][y] ==1) && (neighbors <2)) next [x][y] = 0;
  else if ((board[x][y]==1) && (neighbors >3)) next[x][y] = 0;
  else if ((board[x][y] ==0) && (neighbors ==3)) next[x][y] = 1;
  else next[x][y]= board[x][y];
  }
}
board = next;

for(int i=0; i<columns; i++){
  for(int j=0; j<rows; j++){
    if((board[i][j] == 1)) fill(0);
    else fill(255);
    stroke(0);
    rect(i*w,j*w, w,w);  
  }
}

//the rules
/*if (board[x-1][y-1] == 1) neighbors ++;
if (board[x][y-1] == 1) neighbors ++;
if (board[x+1][y-1] == 1) neighbors ++;
if (board[x-1][y] == 1 ) neighbors ++;
if (board[x+1][y] == 1) neighbors ++;
if (board[x-1][y+1] == 1) neighbors ++;
if (board[x][y+1]== 1) neighbors ++;
if (board[x+1][y+1]) neighbors ++;*/

}

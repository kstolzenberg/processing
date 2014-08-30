int i,j,x,y;

//debug function
void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}

void setup(){
size(1000,1000);
background(255);
smooth();
noLoop();
}

void draw(){
int w = 20;
int columns = (width/w);
int rows = (height/w);
color alive = color(0,0,0,170);
color dead = color(255);
int [][] board = new int [columns][rows];

for(int x = 0; x<columns; x++){
  for(int y = 0; y < rows; y++){
    board[x][y] = int(random(2));
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
  
  if ((board[x][y] == 1) && (neighbors < 2)) next [x][y] = 0;
  else if ((board[x][y]==1) && (neighbors >3)) next[x][y] = 0;
  else if ((board[x][y] ==0) && (neighbors ==3)) next[x][y] = 1;
  else next[x][y]= board[x][y];
  }
}
board = next;

for(int i=0; i<columns; i++){
  for(int j=0; j<rows; j++){
    if((board[i][j] == 1)) fill(alive);
    else fill(dead);
    stroke(255);
    rect(i*w,j*w, w,w);  
  }
}
}

void keyPressed(){
  int l=0;
  if (keyCode == ENTER){
    saveFrame("output"+l+".jpg");
   l = l+1;
  }
}

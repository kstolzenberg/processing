//create print 2D array function for debugging
int i;

void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}

int [][] coords_for_box_A = { {50, 100}, {100, 100}, {50, 200}, {100, 200} };
int [][] coords_for_box_B = { {20, 50}, {75, 50}, {20, 150}, {75, 150} };

void setup(){
  size(500,500);
  noLoop();
  noStroke();
}

void draw(){
  print2DArray(coords_for_box_A);
}

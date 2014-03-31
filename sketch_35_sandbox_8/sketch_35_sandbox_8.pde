//sandbox for subdivide function for more precise checking
//next weekend: combine with collision checker....ask matt about other function and about y-coordinate?

int i;

void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}

//begin function - where count = #line segments
//x-coord only!
int [][] midpointGenerator(int [][] coords_for_point_1, int [][] coords_for_point_2, int count){
  int totalLength, newSegmentLength, newPoint;
  totalLength = coords_for_point_2 [1][0] - coords_for_point_1 [0][0];
  newSegmentLength = totalLength / count;
  
  for (i=1; i<count; i++){
    newPoint = coords_for_point_1[0][0]+newSegmentLength*i;
    coords_for_point_1 = (int[][])append(coords_for_point_1, new int []{newPoint,coords_for_point_1[0][1]});  
  }
  return coords_for_point_1;
}

void setup() {
  size(500, 500);
  background(51);
  noStroke();
  noLoop();
}

void draw() {
  int [][] coords_for_point_1 = {{60,100},{180,100},{50,200},{150,200}};
  print2DArray(midpointGenerator(coords_for_point_1, coords_for_point_1, 2));
}


//sandbox for subdivide function for more precise checking

int i;

void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}

//where count = # segments not points
int [][] midpointGenerator(int [] point_1, int [] point_2, int count){
  int totalLength, newSegmentLength,newPoint,xCheck,yCheck;
  int [][] midpointArray = {};
  
  xCheck = abs(point_1[0] - point_2[0]);
  yCheck = abs(point_1[1] - point_2[1]);
  
  if(yCheck == 0){
    totalLength = point_2[0] - point_1[0];
    newSegmentLength = totalLength / count;  
    for (i=1; i<count; i++){
    newPoint = point_1[0]+newSegmentLength*i;
    midpointArray = (int[][])append(midpointArray, new int []{newPoint, point_1[1]});
    }     
  }else if (xCheck == 0){
    totalLength = point_2[1] - point_1[1];
    newSegmentLength = totalLength / count;    
    for (i=1; i<count; i++){
    newPoint = point_1[1]+newSegmentLength*i;
    midpointArray = (int[][])append(midpointArray, new int []{point_1[0], newPoint});
    } 
  }  
  return midpointArray;
}

int [][] addMidpointsToShape(int[][]coords_for_shape){
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[0], coords_for_shape[1], 4));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[1], coords_for_shape[3], 4));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[0], coords_for_shape[2], 4));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[2], coords_for_shape[3], 4));   
  return coords_for_shape;
}


void setup() {
  size(500, 500);
  background(51);
  noStroke();
  noLoop();
}

void draw() {
  int [][] coords_for_shape = {{60,100},{180,100},{60,200},{180,200}};
  print2DArray(addMidpointsToShape(coords_for_shape));
}


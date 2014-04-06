//proto for house collisions using basic objects and boolean checker
//HAD TO TEST THE REVERSE AS WELL - THIS WILL BE DIFFICULT WITH 3 OBJECTS
int i;

void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}

boolean Touching = true;
 
void setup(){
  size(500,500);
  background(255);
  smooth();
  noStroke();
  noLoop();
}

class Box{
  int x,y,w,h;
  Box(){
    w = 300;
    h = 100;
    x = int(random(width-this.w));
    y = int(random(height-this.h));
  }
  void drawBox(){
    fill(217,17,90,200);
    rect(x,y,w,h);
  }
  
  int [][] getArray(){
  int [][] coords_for_box_A = {
    {this.x, this.y},
    {this.x+this.w,this.y},
    {this.x,this.y+this.h},
    {this.x+this.w,this.y+this.h},
    //+ waypoints
    {this.x+this.w/2,this.y},
    
    {this.x+this.w/2,this.y+this.h},
  };
  return coords_for_box_A;
  }
}

class Bux{
  int x,y,w,h;
  Bux(){
    w = 200;
    h = 300;
    x = int(random(width-this.w));
    y = int(random(height-this.h));
  }
  
  void drawBux(){
    fill(90,243,25,200);
    rect(x,y,w,h);
  }
  
  int [][] getArray(){
  int [][] coords_for_box_B = {
    {this.x, this.y},
    {this.x+this.w,this.y},
    {this.x,this.y+this.h},
    {this.x+this.w,this.y+this.h}
  };
  return coords_for_box_B;
  }
}


//MIDPOINT GENERATOR AND CONCATENATOR: where count = # segments not points
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
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[0], coords_for_shape[1], 12));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[1], coords_for_shape[3], 12));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[0], coords_for_shape[2], 12));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[2], coords_for_shape[3], 12));   
  return coords_for_shape;
}


boolean ShapeCollision(int [][] coords_for_box_A, int [][] coords_for_box_B){
  boolean a_to_b;
  boolean b_to_a;  
  //println("Coords of red box, inside green box?");
  a_to_b = ShapeCollisionOneDirection(coords_for_box_A, coords_for_box_B);
  //println("Coords of green box, inside red box?");
  b_to_a = ShapeCollisionOneDirection(coords_for_box_B, coords_for_box_A);
  
  println("a to b colliding?: "+a_to_b);
  println("b to a colliding?: "+b_to_a);
  
  if (a_to_b || b_to_a){
    return true;
  }else{
    return false;
  }

}

boolean ShapeCollisionOneDirection(int [][] coords_for_box_A, int [][] coords_for_box_B){

  // box A is pink
  // box B is green
  int i;
  boolean x_check1,x_check2,y_check1,y_check2;
  boolean Inside;
  boolean [] touchArr = {};
  
  addMidpointsToShape(coords_for_box_A);
  addMidpointsToShape(coords_for_box_B);  
  
  for (i=0; i<coords_for_box_A.length; i++){

    x_check1 = (coords_for_box_A[i][0] >= coords_for_box_B[0][0]);
    x_check2 = (coords_for_box_A[i][0] <= coords_for_box_B[3][0]);
    y_check1 = (coords_for_box_A[i][1] >= coords_for_box_B[0][1]);
    y_check2 = (coords_for_box_A[i][1] <= coords_for_box_B[3][1]); 
   
    
    if ((x_check1 && x_check2) && (y_check1 && y_check2)){
      Inside = true;
    } else {
      Inside = false;
    }
    
    touchArr = (boolean[])append(touchArr, Inside);
  }
  
  
  if (touchArr[0] || touchArr [1] || touchArr[2] || touchArr[3]){
    return Touching = true;
  }else{
    return Touching = false;
  }
}


void draw(){
  boolean collision = true;

  Box boxA = new Box();
  Bux boxB = new Bux();
  collision = ShapeCollision(boxA.getArray(), boxB.getArray());
  println("collision? "+collision);

  while (collision){
    println("RETRY");
    boxA = new Box();
    boxB = new Bux();
    collision = ShapeCollision(boxA.getArray(), boxB.getArray());
  }
  
  if (!collision){
    boxA.drawBox();
    boxB.drawBux();
    println("they didnt touch");
  }
}


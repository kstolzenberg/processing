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
    w = 200;
    h = 200;
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
    {this.x+this.w,this.y+this.h}
  };
  return coords_for_box_A;
  }
}

class Bux{
  int x,y,w,h;
  Bux(){
    w = 400;
    h = 200;
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

boolean ShapeCollision(int [][] coords_for_box_A, int [][] coords_for_box_B){

  boolean a_to_b;
  boolean b_to_a;
  
  println("Coords of red box, inside green box?");
  a_to_b = ShapeCollisionOneDirection(coords_for_box_A, coords_for_box_B);
  println("Coords of green box, inside red box?");
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
  boolean x_check1;
  boolean y_check1;
  boolean x_check2;
  boolean y_check2;
  boolean Inside;
  boolean [] touchArr = {};

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
  
  println(touchArr);
  
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


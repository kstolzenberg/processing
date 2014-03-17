//proto for house collisions using basic objects and boolean checker
//note: inequalites should include "=" for very tightly constrained cases but then need a break
//lets try and wrap this into the other proto...the goal is not perfection but generally not odd.

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
    fill(217,17,90);
    rect(x,y,w,h);
  }
  
  int [][] getArray(){
  int [][] coords_for_box_A = { {this.x, this.y}, {this.x+this.w,this.y}, {this.x,this.y+this.h}, {this.x+this.w,this.y+this.h} };
  return coords_for_box_A;
  }
}

class Bux{
  int x,y,w,h;
  Bux(){
    w = 200;
    h = 200;
    x = int(random(width-this.w));
    y = int(random(height-this.h));
  }
  
  void drawBux(){
    fill(243,90,25);
    rect(x,y,w,h);
  }
  
  int [][] getArray(){
  int [][] coords_for_box_B = { {this.x, this.y}, {this.x+this.w,this.y}, {this.x,this.y+this.h}, {this.x+this.w,this.y+this.h} };
  return coords_for_box_B;
  }
}

boolean ShapeCollision(int [][] coords_for_box_A, int [][] coords_for_box_B){
  int i;
  boolean Inside;
  boolean [] touchArr = {};

  for (i=0; i<coords_for_box_A.length; i++){
    if ((coords_for_box_A[i][0] > coords_for_box_B[0][0] && coords_for_box_A[i][0] < coords_for_box_B[3][0]) && (coords_for_box_A[i][1] > coords_for_box_B[0][1] && coords_for_box_A[i][1] < coords_for_box_B[3][1])){
      Inside = true;
    } else {
      Inside = false;
    }
    touchArr = (boolean[])append(touchArr, Inside);
  }
  
  if (touchArr[0] || touchArr [1] || touchArr[2] || touchArr[3] == true){
    return Touching = true;
    
  }else{
    return Touching = false;
  }
}

void draw(){
  Box boxA = new Box();
  Bux boxB = new Bux();  
  println(ShapeCollision(boxA.getArray(), boxB.getArray()));

  while (Touching){
    println("RETRY");
    boxA = new Box();
    boxB = new Bux();
    println(ShapeCollision(boxA.getArray(), boxB.getArray()));
  }
  
  if (!Touching){
    boxA.drawBox();
    boxB.drawBux();
    println("they didnt touch");
  } 
}


//proto for house collisions

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
    x = int(random(width-w));
    y = int(random(height-h));
    w = 100;
    h = 80;
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
    x = int(random(width-w));
    y = int(random(height-h));
    w = 200;
    h = 200;
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
  boolean Touching = true;
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
  boxA.drawBox();
  boxB.drawBux();
  println(ShapeCollision(boxA.getArray(), boxB.getArray()));
}

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
}

boolean ShapeCollision(int [][] coords_for_box_A, int [][] coords_for_box_B){
  int i;
  boolean Inside = false;
  boolean Touching = true;
  boolean [] touchArray = {};
  println("number of coords: "+coords_for_box_A.length);

  for (i=0; i<coords_for_box_A.length; i++){
      if ((positionA[i][0] > positionB[i][0] && positionA[i][0] < positionB[i][0]) && (positionA[i][0] > positionB[i][0] && positionA[i][0] < positionB[i][i])){
      Inside = true;
      } else {
         Inside = false;
        println(coords_for_box_A[i]);
      }
    println(Inside);
    touchArray = (boolean)append(touchArray, Inside);
  if (touchArray[0] || touchArray[1] || touchArray[2] || touchArray[3] == true ){
    println(Touching);
    return Touching = true;
  }  
  return Touching = false;
}

void draw(){
  Box boxA = new Box();
  Bux boxB = new Bux();  
  int [][] coords_for_box_A = { {boxA.x, boxA.y}, {boxA.x+boxA.w, boxA.y}, {boxA.x, boxA.y+boxA.h}, {boxA.x+boxA.w, boxA.y+boxA.h} };
  int [][] coords_for_box_B = { {boxB.x, boxB.y}, {boxB.x+boxB.w, boxB.y}, {boxB.x, boxB.y+boxB.h}, {boxB.x+boxB.w, boxB.y+boxB.h} };
  ShapeCollision(coords_for_box_A, coords_for_box_B);
  boxA.drawBox();
  boxB.drawBux();
  println(boxB.getClass().getSimpleName());
}

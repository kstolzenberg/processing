//proto for house collisions

void setup(){
  size(500,500);
  background(255);
  smooth();
  noStroke();
  noLoop();
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
  int [][] coords_for_box_A = { {10, 100}, {50, 100}, {10, 200}, {50, 200} };
  int [][] coords_for_box_B = { {20, 50}, {75, 50}, {20, 150}, {75, 150} };
  println((ShapeCollision(coords_for_box_A, coords_for_box_B)));
}

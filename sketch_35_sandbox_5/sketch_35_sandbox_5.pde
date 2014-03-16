//abandoned early proto for house collisions - does not work!

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



boolean ShapeCollision(int shape1,int shape2){
  
  
  boolean Inside = false;
  boolean Touching = false;
  boolean [] touchArray = {};
  //getPositionArray(shape1);
  
  for(i=0; i<positionArray.length;i++){
    if ((positionArray[i][i] > shape2.x && positionArray[i][i] < shape2.x+shape2.w) && (positionArray[i][i+1] > shape2.y && positionArray[i][i+1] < shape2.y+shape.h)){
      return  Inside = true;
      } else {
        return Inside = false; 
      }
    return touchArray = (boolean)append(touchArray, Inside);
    }
    
  if (touchArray[0] || touchArray[1] || touchArray[2] || touchArray[3] == true ){
    return Touching = true;
    }  
}


void draw(){
  Box boxA = new Box();
  Bux boxB = new Bux();
  boxA.drawBox();
  boxB.drawBux();
  ShapeCollision(boxA,boxB);
}



//goal: use matricies and objects to draw a grid for baby judderator
//now make data structure to hold random placement of random boxes
//make more objects with some element of variation in them #1
int j=0;
int i;

class Box{
  float x,y,w,h, x2, y2, a,b,c,d;
  Box(){
    x = 25;
    y = 25;
    w = 51;
    h = 72;
    x2 = x+random(w);
    y2 = y+h;
  }
  void drawBox(){
    fill(255,255,0);
    strokeWeight(4);
    stroke(0);
    rect(x,y,w,h);
    line(x,y,x2,y2);
  }
}


class Box2{
  float x,y, w, h, x2, y2;
  Box2(){
    x = 25;
    y = 25;
    w = 51;
    h = 72;
    x2 = x+w;
    y2 = y+random(h); 
  }  
  void drawBox2(){
    fill(247,58,10,150);
    strokeWeight(4);
    stroke(0);
    rect(x,y,w,h);
    line(x,y+h/2,x2,y2);
  }
}


void setup(){
  size(1000,1000);
  background(255);
  smooth();

}

void draw(){}

void drawArray(){
  for (int i=0; i< height; i+=100){
    for (int j=0; j<width; j+=100){
      pushMatrix();
      Box thisBox = new Box();
      Box2 thisBox2 = new Box2();
      translate(j,i);
      thisBox.drawBox();
      translate(10,10);
      thisBox2.drawBox2();
      popMatrix();
    }
  }
}


void mouseReleased(){
  drawArray();
}

void keyPressed(){
  if (keyCode == ENTER){
    saveFrame("output"+j+".jpg");
   j = j+1;
  }
}



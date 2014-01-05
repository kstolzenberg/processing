//goal: use matricies and objects to draw a grid for baby judderator
//now make data structure to hold random placement of random boxes
//make more objects with some element of variation in them #1
int j=0;
int i;

class Box{
  float x,y,w,h, x2, y2;
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
    fill(247,58,10);
    strokeWeight(4);
    stroke(0);
    rect(x,y,w,h);
    line(x,y+h/2,x2,y2);
  }
}


void setup(){
  size(500,500);
  background(255);
  smooth();

}

void draw(){}

void drawArray(){
  for(i=0; i<500-51; i=i+51+25){
    pushMatrix();
    Box thisBox = new Box();
    translate(i,0);
    thisBox.drawBox();
    
    Box thisBox3 = new Box();
    translate(0, thisBox3.h+25);
    thisBox3.drawBox();
    
    Box thisBox4 = new Box();
    translate(0, thisBox4.h+25);
    thisBox4.drawBox();
    
    Box2 thisBox2 = new Box2();
    translate(0, thisBox2.h+25);
    thisBox2.drawBox2();
    
    Box thisBox5 = new Box();
    translate(0, thisBox5.h+25);
    thisBox5.drawBox();
    popMatrix();
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



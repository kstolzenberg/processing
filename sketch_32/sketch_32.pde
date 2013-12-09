//goal: use matricies and objects to draw a grid for baby judderator
int j=0;
int i;

class Box{
  float x,y,w,h, x2, y2;
  
  Box(){
    x = 25;
    y = 25;
    w = 51;
    h = 72;
    x2 = x+w;
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
    translate(0, thisBox.h+25);
    thisBox.drawBox();
    translate(0, thisBox.h+25);
    thisBox.drawBox();
    translate(0, thisBox.h+25);
    thisBox.drawBox();
     translate(0, thisBox.h+25);
    thisBox.drawBox();
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



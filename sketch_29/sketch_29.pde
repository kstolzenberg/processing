int _numChildren = 3;
int _maxLevels = 3;
Branch _trunk;

void setup(){
size(500,500);
background(255);
noFill();
smooth();
newTree();
}

void newTree(){
  _trunk = new Branch(1,0,width/2,50);
  _trunk.drawMe();
}

class Branch{
  float level, index;
  float x, y;
  float endx, endy;
  
  Branch(float lev, float ind, float ex, float why){
    level = lev;
    index = ind;
    updateMe(ex, why);
  }
  
  void updateMe(float ex, float why){
  x = ex;
  y = why;
  endx = x +150;
  endy = y + 15;
  }
  
  void drawMe(){
  line(x, y, endx, endy);
  ellipse(x,y,5,5);
  }
}

int _numChildren = 3;
int _maxLevels = 3;
Branch _trunk;

void setup(){
size(750,500);
background(0);
noFill();
stroke(200,100);
strokeWeight(10);
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
  
  Branch[]children = new Branch[0];
  
  Branch(float lev, float ind, float ex, float why){
    level = lev;
    index = ind;
    updateMe(ex, why);
  
  if (level < _maxLevels) {
    children = new Branch[_numChildren];
    for (int x = 0; x < _numChildren; x++){
      children[x] = new Branch(level+1, x , endx, endy);
      }
    }
  }
  
  void updateMe(float ex, float why){
  x = ex;
  y = why;
  endx = x + (level * (random(100)-50));
  endy = y + 50 + (level * random(50));
  }
  
  void drawMe(){
  line(x, y, endx, endy);
  ellipse(x,y,5,5);
  for (int i=0; i<children.length; i++){
    children[i].drawMe();
  }
  }
}

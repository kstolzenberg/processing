int _num=10;
int j= 0;
Tri[] _TriArr = {};

class Tri{
  float x, y, z, a, b, c, k, center_x, center_y, h;
  color linecol;
  color fillcol;
  float alph;
  
  Tri(){
  k = 50;
  x = random(width);
  y = random(height);
  z = x + k/2;
  a = y + (sqrt(3)/2) * k;
  b = x + k;
  c = y + 0;
  h = (sqrt(3)/2) * k;
  center_x = x + (k/2); 
  center_y = y + (k/(2*sqrt(3)));
  linecol = color(random(255),random(255),random(255));
  fillcol = 0;
  }

  void drawMe(){
    fill(fillcol);
    stroke(linecol);
    strokeWeight(4);
    triangle(x,y,z,a,b,c);
  }
  
  
  void checkMe(){
    boolean touching = false;
    print("  triangles currently in array: "+_TriArr.length+"\n");
    for (int i=0; i< _TriArr.length - 1; i++) {
      print("  hi triangle#"+i+",");
      Tri otherTri = _TriArr[i];
      Tri currTri = _TriArr[_TriArr.length - 1];

      float dis = dist(currTri.center_x, currTri.center_y, otherTri.center_x, otherTri.center_y);
      print(" you are "+ dis + "px away\n");

      if (dis < h) {
        print("  filling!\n");
        fillcol = (255);
      }
      
      drawMe();
      
      }

      print("\n\n");

    }
}
 

void setup(){
  size(500,500);
  background(255);
  smooth();
  drawTri();
}

void draw(){
}

void mouseReleased(){
  drawTri();
}

void drawTri(){
  for(int i=0; i< _num; i++){
    Tri thisTri = new Tri();
    print("draw triangle#"+i+"...\n");
    //note: the array is the way that we can assign behavior to objects..its how to keep track of them to ref
    _TriArr = (Tri[])append(_TriArr, thisTri);
    thisTri.checkMe();
  }
}

void keyPressed(){
    if (keyCode == ENTER){
      saveFrame("output"+j+".jpg");
      j = j+1;
        }
  }


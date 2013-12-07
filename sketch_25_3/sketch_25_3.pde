int _num=1;
int j= 1;
Tri[] _TriArr = {};

class Tri{
  float x, y, z, a, b, c, k, center_x, center_y;
  color linecol;
  color fillcol;
  float alph;
  
  Tri(){
  k = 50;
  x = random(50, width-50);
  y = random(50, height-50);
  z = x + k/2;
  a = y + (sqrt(3)/2) * k;
  b = x + k;
  c = y + 0;
  center_x = x + (k/2); 
  center_y = y + (k/(2*sqrt(3)));
  linecol = color(random(255),random(255),random(255));
  fillcol = color(0);
  }

  void drawMe(){
    fill(fillcol);
    stroke(linecol);
    strokeWeight(3);
    triangle(x,y,z,a,b,c);
  }
  
  
  void checkMe(){
    boolean touching = false;
    print("  triangles currently in array: "+_TriArr.length+"\n");
    for (int i=0; i< _TriArr.length - 1; i++) {
      print("  hi triangle#"+i+",");
      Tri otherTri = _TriArr[i];
      Tri currTri = _TriArr[_TriArr.length - 1];

      float dis = dist(currTri.x, currTri.y, otherTri.x, otherTri.y);
      print(" you are "+ dis + "px away\n");

      if (dis < 50) {
        print("  filling!\n");
        fillcol = 200;
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


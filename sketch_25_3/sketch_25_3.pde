int _num=6;
int j= 1;
Tri[] _TriArr = {};

class Tri{
  float x, y, z, a, b, c, k, px, py;
  color linecol;
  //color fillcol;
  float alph;
  
  Tri(){
  k = 10;
  x = random(50, width-50);
  y = random(50, height-50);
  z = x + k/2;
  a = y + (sqrt(3)/2) * k;
  b = x + k;
  c = y + 0;
  px = x + k/2; 
  py = y + k/(2*sqrt(3));
  linecol = color(random(255),random(255),random(255));
  //fillcol = color(0);
  }

  void drawMe(){
    //fill(100);
    stroke(linecol);
    strokeWeight(random(10));
    triangle(x,y,z,a,b,c);

    boolean touching = false;
    print(_TriArr.length+" ");
    for (int i=0; i< _TriArr.length; i++) {
      print("hi"+i+" ");
      Tri otherTri = _TriArr[i];

      float dis = dist(x,y,otherTri.px, otherTri.py);
      //print(dis + " " + a +"\n");

      if (dis < a ){
        touching = true;
        //break;
        }
      }

      print("\n");

      if (touching) {
        //print("yes");
        fill(50);
      } else {
        //print("nope");
        fill(200);
      }
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
    thisTri.drawMe();
    //note: the array is the way that we can assign behavior to objects..its how to keep track of them to ref
    _TriArr = (Tri[])append(_TriArr, thisTri);
  }
}

void keyPressed(){
    if (keyCode == ENTER){
      saveFrame("output"+j+".jpg");
      j = j+1;
        }
  }


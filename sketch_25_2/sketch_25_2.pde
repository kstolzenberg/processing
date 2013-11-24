int _num=10;
int j= 1;

class Tri{
  float x, y, z, a, b, c, k;
  color linecol, fillcol;
  float alph;
  
  Tri(){
  k = 100;
  x = random(width);
  y = random(height);
  z = x + k/2;
  a = y - sqrt(3)/2 * k;
  b = x + k;
  c = y + 0;
  linecol = color(random(255),random(255),random(255));
  fillcol = color(255,255,255);
  //alph = random(255);
  }

  void drawMe(){
    fill(fillcol,alph);
    stroke(linecol);
    strokeWeight(random(25));
    triangle(x,y,z,a,b,c);
    }
}


void setup(){
  size(1000,1000);
  background(255);
  smooth();
  strokeWeight(2);
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
  }
}

void keyPressed(){
    if (keyCode == ENTER){
      saveFrame("output"+j+".jpg");
      j = j+1;
        }
  }


int _num=10;
int j= 1;


class Tri{
  
  float x, y, z, a, b, c;
  color linecol, fillcol;
  float alph;
  
  Tri(){
  x = random(width);
  y = random(height);
  z = random(width);
  a = random(height); 
  b = random(width);
  c = random(height); 
  linecol = color(random(255),random(255),random(255));
  fillcol = color(255,255,255);
  //alph = random(255);
  }

  void drawMe(){
    fill(fillcol,alph);
    stroke(linecol);
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


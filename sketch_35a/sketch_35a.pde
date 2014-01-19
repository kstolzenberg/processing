/*wish list:
*/

class Window {
  //object properties
  float a,b,c,d;
  //constructor - this.xx clarifies property of the object instead of parameter
  Window(){
    a = 200;
    b = 200;
    c = 20;
    d = 20;
  }
  //methods
  void drawWindow(){
    stroke(0);
    strokeWeight(1);
    fill(152,225,253);
    rect(a,b,c,d);
  }
}


class House {
  float x,y,w,h,x2,y2;
  Window window;
  
  House(float x, float y, float w, float h, Window window){
    this.x = random(width);
    this.y = random(height);
    this.w = 50;
    this.h = 100;
    this.window = window;
    x2 = random(this.w - window.c);
    y2 = random(this.h - window.d);
  }
  
  void drawHouse(){
    stroke(100,5,82);
    fill(202,236,13);
    strokeWeight(3);
    rect(x,y,w,h);
    window.a = x+x2;
    window.b = y+y2;
    window.drawWindow();
    //next version should inspect width and then figure out where to go
  }
}


void setup(){
  size(500,500);
  background(255);
  smooth();
}


void draw(){}

void drawArch(){
  Window window = new Window();
  House myHouse = new House(100,100,100,100,window);
  myHouse.drawHouse();
}

void mouseReleased(){
  drawArch();
}

void keyPressed(){
  if(keyCode==ENTER){
    saveFrame("output3.jpg");
  }
}

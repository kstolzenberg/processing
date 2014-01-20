
//throw out overlap things
//consider random incrementor ..like irl grid?
//add stairs line 1/5px if y>5 for door
// I think if you don't pass parameters in constructor, you can't change it outside of object def? ideally could just pass diff params through same window object for 1-3 instances?

int j=0;
int i;
int k;

class Window{
  float a, b, c, d, m;
  Window(){
    a = 200;
    b = 200;
    c = 15;
    d = 30;
    m = 2;
  }
  void drawWindow(){
  stroke(0);
  strokeWeight(1);
  fill(152,225,253);
  rect(a,b,c,d);
  rect(a+m, b+m, c-m*2, d-m*2);
  }
}

//should be tidied to eventually a part of one window object...
class Lite{
  float a, b, c, d, m;
  Lite(){
    a = 200;
    b = 200;
    c = 40;
    d = 30;
    m = 2;
  }
  void drawLite(){
  stroke(0);
  strokeWeight(1);
  fill(152,225,253);
  rect(a,b,c,d);
  rect(a+m, b+m, c-m*2, d-m*2);
  }
}

class Door{
  float a, b, c, d, m;
  Door (){
    a = 200;
    b = 200;
    c = 20; 
    d = 40;
    m = 5;
  }
  void drawDoor(){
    fill(232,39,25);
    stroke(0);
    strokeWeight(1);
    rect(a,b,c,d);
    ellipse(a+m/2,b+d/2,2,2);
    fill(152,225,253);
    rect(a+m, b+m, c-m*2, d-m*2);
  }
}

class House{
  float x,y,w,h,x2,y2, x3, y3, x4, y4;
  Window window;
  Door door;
  Lite lite;
  
  House(float x, float y, float w, float h, Window window, Door door, Lite lite){
    this.x = 25;
    this.y = 25;
    this.w = 125;
    this.h = 150;
    this.window = window;
    this.door = door;
    this.lite = lite;
    x2 = random(this.w - window.c); 
    y2 = random(this.h - window.d);
    x4 = random(this.w - lite.c); 
    y4 = random(this.h - lite.d);
    x3 = random(this.w - door.c);
    y3 = random(this.h - door.d);
  }
  
  void drawHouse(){
    fill(26,106,123);
    strokeWeight(2);
    stroke(0);
    rect(x,y,w,h);
    window.a = x+x2;
    window.b = y+y2;
    lite.a = x+x4;
    lite.b = y+y4;
    door.a = x+x3;
    door.b = y+y3;
    //stairs - hrm the bottom incrementor isn't quite there...why 19? closest to y-offset?
    float q = this.h-19-door.b+door.d;
    if(door.b < this.y+this.h-5){
      for(k=0; k<q; k+=5){
        strokeWeight(1);
        rect(door.a,door.b+k,door.c,5);
      }
    }
    window.drawWindow();
    door.drawDoor();
    lite.drawLite();
  }
}


void setup(){
  size(1000,1000);
  background(255);
  smooth();

}

void draw(){}

void drawArray(){
  for (int i=0; i< height; i+=200){
    for (int j=0; j<width; j+=200){
      pushMatrix();
      Window window = new Window();
      Door door = new Door();
      Lite lite = new Lite();
      House thisHouse = new House(100,100,100,100,window,door,lite);
      translate(j,i);
      thisHouse.drawHouse();
      popMatrix();
    }
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



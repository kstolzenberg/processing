//throw out overlap things
//globals
int i,j,k,n;
int l = 0;


int randRange(int min_val, int max_val, int step){
  int count = (max_val - min_val) / step;
  return (int(random(0, count)) * step) + min_val;
}

class Window{
  int a, b, c, d, m;
  //float x, y, width, height, margin;
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
  fill(40,40,40);
  rect(a,b,c,d);
  fill(152,225,253);
  rect(a+m, b+m, c-m*2, d-m*2);
  }
}

//should be tidied to eventually a part of one window object...through inheritance? is a vs has a 
class Lite{
  int a, b, c, d, m;
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
  fill(40,40,40);
  rect(a,b,c,d);
  fill(152,225,253);
  rect(a+m, b+m, c-m*2, d-m*2);
  }
}

class Door{
  int a, b, c, d, m;
  Door (){
    a = 200;
    b = 200;
    c = 20; 
    d = 40;
    m = 5;
  }
  void drawDoor(){
    fill(97,25,0);
    stroke(0);
    strokeWeight(1);
    rect(a,b,c,d);
    ellipse(a+m/2,b+d/2,2,2);
    fill(152,225,253);
    rect(a+m, b+m, c-m*2, d-m*2);
  }
}

class House{
  int x,y,w,h,x2,y2, x3, y3, x4, y4;
  Window window;
  Door door;
  Lite lite;
  
  House(int x, int y, int w, int h, Window window, Door door, Lite lite){
    this.x = 25;
    this.y = 25;
    this.w = 125;
    this.h = 150;
    this.window = window;
    this.door = door;
    this.lite = lite;
    x2 = int(random(this.w - window.c)); 
    y2 = randRange(0, (this.h - window.d), 5);
    x4 = int(random(this.w - lite.c)); 
    y4 = randRange(0, (this.h - lite.d), 5);
    x3 = int(random(this.w - door.c));
    y3 = randRange(0, (this.h - door.d) , 5);
  }
  
  void drawHouse(){
    int z;
    fill(254,88,30);
    strokeWeight(2);
    stroke(0);
    rect(x,y,w,h);
    window.a = x+x2;
    window.b = y+y2;
    lite.a = x+x4;
    lite.b = y+y4;
    door.a = x+x3;
    door.b = y+y3;
    //siding
    for(z=this.y; z<this.h+this.y;z+=10){
      strokeWeight(.5);
      line(this.x, z, this.x+this.w,z);
    }
    //stairs
    float q = this.h + this.y-(door.b);
    if(door.b < (this.y+this.h-5)){
      for(k=0; k<q; k+=5){
        strokeWeight(1);
        fill(40,40,40);
        rect(door.a,door.b+k,door.c,5);
      }
    }
    window.drawWindow();
    door.drawDoor();
    lite.drawLite();
  }
  
  //check doesn't work :< ///check 2D array notation and look into passing function params.
  /*void checkOverlap(){
    boolean touch = true;
    Window[][] winCorners = {{window.a, window.b},{window.a+window.c,window.b},{window.a,window.b+window.d},{window.a+window.c,window.b+window.d}};
    Lite[][] liteCorners = {{lite.a,lite.b},{lite.a+lite.c,lite.b},{lite.a,lite.b+lite.d},{lite.a+lite.c,lite.b+lite.d}};
    Door[][] doorCorners = {{door.a,door.b},{door.a+door.c,door.b},{door.a,door.b+door.d},{door.a+door.c,door.b+door.d}};
    
    for(n=0; n<4; n++){
      if((winCorners[n][n] > liteCorners[n][n] && winCorners[n][n] < liteCorners[n+1][n]) && (winCorners[n][n+1] > liteCorners[n][n+1] && winCorners[n][n+1] < liteCorners[n+1][n+1])){
        return (touch);
        println("they touchin!");
        fill(0,100);
        this.drawHouse();
      }else {
        this.drawHouse();
      }
    }
   }*/
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
    saveFrame("output"+l+".jpg");
   l = l+1;
  }
}



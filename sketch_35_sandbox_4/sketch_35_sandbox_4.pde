//sandbox for single house object with basic collision detection, no dependent redraw yet

boolean Touching = false;
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
  fill(155,225,253);
  rect(a,b,c,d);
  rect(a+m, b+m, c-m*2, d-m*2);
  }
  //store corners for checking in an array:
  int [][] getArray(){
  int [][] coords_for_Window = { {this.a, this.b}, {this.a+this.c,this.b}, {this.a,this.b+this.d}, {this.a+this.c,this.b+this.d} };
  return coords_for_Window;
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
  fill(152,225,253);
  rect(a,b,c,d);
  rect(a+m, b+m, c-m*2, d-m*2);
  } 
  int [][] getArray(){
  int [][] coords_for_Lite = { {this.a, this.b}, {this.a+this.c,this.b}, {this.a,this.b+this.d}, {this.a+this.c,this.b+this.d}  };
  return coords_for_Lite;
  } 
}

class Door{
  int a, b, c, d, m, q, r;
  //where q and r help draw the stair
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
    //stairs
    fill(80,54,68);
    float q=200;
    float r=250 ;
    //q = door at bottom, no stair, r = door at 1 step; both will get rewritten by the house objecy
    if(this.b < r){
      for(k=0; k<this.q-this.d; k+=5){
        strokeWeight(1);
        rect(this.a,this.b+this.d+k,this.c,5);
      }
    }
  }
  
  int [][] getArray(){
  int [][] coords_for_Door = { {this.a, this.b}, {this.a+this.c,this.b}, {this.a,this.b+this.d}, {this.a+this.c,this.b+this.d}  };
  return coords_for_Door;
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
    door.q = this.h-(door.b) + this.y;
    door.r = this.y+this.h-5;
    
    println("lite-door touch:"+ShapeCollision(lite.getArray(), door.getArray()));
    println("lite-window touch:"+ShapeCollision(lite.getArray(), window.getArray()));
    println("door-window touch:"+ShapeCollision(door.getArray(), window.getArray()));
 
    window.drawWindow();
    door.drawDoor(); 
    lite.drawLite();
  }
}


void setup(){
  size(500,500);
  background(255);
  smooth();

}

void draw(){
}

//this boolean doesn't work when one shape is completely within the bounds of another...works best with corners.
boolean ShapeCollision(int [][] coords_for_Window, int [][] coords_for_Door){
  int i;
  boolean Inside;
  boolean [] touchArr = {};
  for (i=0; i<coords_for_Window.length; i++){
    if ((coords_for_Window[i][0] >= coords_for_Door[0][0] && coords_for_Window[i][0] <= coords_for_Door[3][0]) && (coords_for_Window[i][1] >= coords_for_Door[0][1] && coords_for_Window[i][1] <= coords_for_Door[3][1])){
      Inside = true;
    } else {
      Inside = false;
    }
    touchArr = (boolean[])append(touchArr, Inside);
  }  
  if (touchArr[0] || touchArr [1] || touchArr[2] || touchArr[3] == true){
    return Touching = true;    
  }else{
    return Touching = false;
  }
}

void drawArray(){
  Window window = new Window();
  Door door = new Door();
  Lite lite = new Lite();
  House thisHouse = new House(100,100,100,100,window,door,lite);
  thisHouse.drawHouse();
  //collision detection works, now to redraw? previous didn't work bc the checker on the object never changed, change happed in the house definition
  //rework while loop and if (!touching) for this different position case.
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



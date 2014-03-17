//sandbox for single house object, no boolean yet
//goal: add basic checker!

boolean Touching = true;
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
  fill(152,225,253);
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
  int a, b, c, d, m;
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
    //create stairs
    float q = this.h + this.y-(door.b);
    if(door.b < (this.y+this.h-5)){
      for(k=0; k<q; k+=5){
        strokeWeight(1);
        rect(door.a,door.b+k,door.c,5);
      }
    }

    //check overlaps of nested shapes
    /*boolean ShapeCollision(int [][] window.coords_for_Window, int [][] door.coords_for_Door){
      int i;
      boolean Inside;
      boolean [] touchArr = {}; 
      
      for (i=0; i<window.coords_for_Window.length; i++){
        if ( (window.coords_for_Window[i][0] > door.coords_for_Door[0][0] && window.coords_for_Window[i][0] < door.coords_for_Door[3][0]) && (window.coords_for_Window[i][1] > door.coords_for_Door[0][1] && window.coords_for_Window[i][1] < door.coords_for_Door[3][1]) ){
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
    
    println( ShapeCollision( window.getArray(), door.getArray() ) );
    while (Touching){
      println("RETRY");
      window = new Window();
      door = new Door();
      println( ShapeCollision(window.getArray(), door.getArray() ) );
    }
    if (!Touching){
      window.drawWindow();
      door.drawDoor();
      println("they didnt touch");
    }*/
    //eventually check overlaps
    //window.drawWindow();
    //door.drawDoor();
    lite.drawLite();
    printArray(window.getArray[]);
  }
}


void setup(){
  size(500,500);
  background(255);
  smooth();
}

void draw(){
}

void drawArray(){
  Window window = new Window();
  Door door = new Door();
  Lite lite = new Lite();
  House thisHouse = new House(100,100,100,100,window,door,lite);
  //may need to repass in through?
  thisHouse.drawHouse();
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



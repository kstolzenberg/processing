//same as sandbox 6 but with different order!

boolean Touching = false;
boolean collision = true;
int i,j,k,n;
int l = 0;

//debug function
void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}

//rounded random function
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
    window.a = this.x+x2;
    window.b = this.y+y2;
    lite.a = this.x+x4;
    lite.b = this.y+y4;
    door.a = this.x+x3;
    door.b = this.y+y3;
    door.q = this.h-(door.b) + this.y;
    door.r = this.y+this.h-5;       
  }
  
  void drawHouse(){
    fill(26,106,123);
    strokeWeight(2);
    stroke(0);
    rect(x,y,w,h);
    
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

boolean ShapeCollision(int [][] coords_for_Window, int [][] coords_for_Door, int [][] coords_for_Lite){
  int [][][] checkShapeArr = {coords_for_Window,coords_for_Door, coords_for_Lite}; 
  //should condense this check!
   boolean a_to_b;
   boolean a_to_c;
   boolean b_to_a;
   boolean b_to_c;
   boolean c_to_b;
   boolean c_to_a;
    
    a_to_b = ShapeCollisionOneWay(checkShapeArr[0], checkShapeArr[1]);
    a_to_c = ShapeCollisionOneWay(checkShapeArr[0], checkShapeArr[2]);
    b_to_a = ShapeCollisionOneWay(checkShapeArr[1], checkShapeArr[0]);
    b_to_c = ShapeCollisionOneWay(checkShapeArr[1], checkShapeArr[2]);
    c_to_b = ShapeCollisionOneWay(checkShapeArr[2], checkShapeArr[1]);
    c_to_a = ShapeCollisionOneWay(checkShapeArr[2], checkShapeArr[0]);  
  
  if (a_to_b || a_to_c || b_to_a || b_to_c || c_to_b || c_to_a){
    return true;
  } else{
    return false;
  }
}


//this boolean doesn't work when one shape is completely within the bounds of another...works best with corners.
boolean ShapeCollisionOneWay(int [][] coords_for_Window, int [][] coords_for_Door){
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
  
  collision = ShapeCollision(lite.getArray(), door.getArray(), window.getArray());
  println("Collision? " + collision);
  
  while(collision){
  println("RETRY");
  window = new Window();
  door = new Door();
  lite = new Lite();
  thisHouse = new House(100,100,100,100,window,door,lite);
  collision = ShapeCollision(lite.getArray(), door.getArray(), window.getArray());
  } 
  
  if (!collision){
    thisHouse.drawHouse();
    println("They didn't touch");
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



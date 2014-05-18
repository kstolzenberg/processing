//success! collision detection & matrix fully working!

boolean Touching = false;
boolean collision = true;
int i,j,k,n;
int l = 0;

void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}

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
    c = randRange(10,60,5);
    d = randRange(10,60,5);
    m = 2;
  }
  void drawWindow(){
  stroke(0);
  strokeWeight(1);
  fill(68,68,68);
  rect(a,b,c,d);
  fill(191,248,250);
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
    c = randRange(10,60,5);
    d = randRange(10,60,10);
    m = 2;
  }
  void drawLite(){
  stroke(0);
  strokeWeight(1);
  fill(68,68,68);
  rect(a,b,c,d);
  fill(191,248,250);
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
    //stairs not being included in the object collision?
    fill(150,47,26);
    stroke(0);
    strokeWeight(1);
    rect(a,b,c,d);
    ellipse(a+m/2,b+d/2,2,2);
    fill(191,248,250);
    rect(a+m, b+m, c-m*2, d-m*2);
    //draw stairs
    fill(68,68,68);
    float q=200;
    float r=250 ;
    //q = door at bottom, no stair, r = door at 1 step; both will get rewritten by the house objecy, stairs drawn btwn q and r
    if(this.b < r){
      for(k=0; k<this.q-this.d; k+=5){
        strokeWeight(1);
        rect(this.a,this.b+this.d+k,this.c,5);
      }
    }
  }
  
  int [][] getArray(){
  int [][] coords_for_Door = { {this.a, this.b}, {this.a+this.c,this.b}, {this.a,this.b+this.d+(this.r)}, {this.a+this.c,this.b+this.d+(this.r)} };
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
    int z;
    fill(190,105,49);
    strokeWeight(2);
    stroke(0);
    rect(x,y,w,h);
    //siding
    for(z=this.y; z<this.h+this.y;z+=10){
      strokeWeight(.5);
      line(this.x, z, this.x+this.w,z);
    }
    
    window.drawWindow();
    door.drawDoor();     
    lite.drawLite();
  }
}


void setup(){
  size(975,1000);
  background(255);
  smooth();

}

void draw(){
}

//MIDPOINT GENERATOR AND CONCATENATOR: where count = # segments not points
int [][] midpointGenerator(int [] point_1, int [] point_2, int count){
  int totalLength, newSegmentLength,newPoint,xCheck,yCheck;
  int [][] midpointArray = {};
  
  xCheck = abs(point_1[0] - point_2[0]);
  yCheck = abs(point_1[1] - point_2[1]);
  
  if(yCheck == 0){
    totalLength = point_2[0] - point_1[0];
    newSegmentLength = totalLength / count;  
    for (i=1; i<count; i++){
    newPoint = point_1[0]+newSegmentLength*i;
    midpointArray = (int[][])append(midpointArray, new int []{newPoint, point_1[1]});
    }     
  }else if (xCheck == 0){
    totalLength = point_2[1] - point_1[1];
    newSegmentLength = totalLength / count;    
    for (i=1; i<count; i++){
    newPoint = point_1[1]+newSegmentLength*i;
    midpointArray = (int[][])append(midpointArray, new int []{point_1[0], newPoint});
    } 
  }  
  return midpointArray;
}

int [][] addMidpointsToShape(int[][]coords_for_shape){
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[0], coords_for_shape[1], 2));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[1], coords_for_shape[3], 2));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[0], coords_for_shape[2], 2));
  coords_for_shape = (int[][])concat(coords_for_shape,midpointGenerator(coords_for_shape[2], coords_for_shape[3], 2));   
  return coords_for_shape;
}

boolean ShapeCollision(int [][] coords_for_Window, int [][] coords_for_Door, int [][] coords_for_Lite){
 int [][] coords_for_Window_Mid = {};
 int [][] coords_for_Door_Mid = {};
 int [][] coords_for_Lite_Mid = {};
 
 coords_for_Window_Mid = addMidpointsToShape(coords_for_Window);
 coords_for_Door_Mid = addMidpointsToShape(coords_for_Door);
 coords_for_Lite_Mid = addMidpointsToShape(coords_for_Lite);
  
  int [][][] checkShapeArr = {coords_for_Window_Mid,coords_for_Door_Mid, coords_for_Lite_Mid}; 
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

boolean ShapeCollisionOneWay(int [][] coords_for_shape_A, int [][] coords_for_shape_B){
  int i;
  boolean x_check1, x_check2, y_check1, y_check2;
  boolean Inside;
  boolean [] touchArr = {};
  boolean check_touch = false;
  

  for (i=0; i<coords_for_shape_A.length; i++){  
    x_check1 = coords_for_shape_A[i][0] >= coords_for_shape_B[0][0];
    x_check2 = coords_for_shape_A[i][0] <= coords_for_shape_B[3][0];
    y_check1 = coords_for_shape_A[i][1] >= coords_for_shape_B[0][1];
    y_check2 = coords_for_shape_A[i][1] <= coords_for_shape_B[3][1];
    
    if ((x_check1 && x_check2) && (y_check1 && y_check2)){
      Inside = true;
    } else {
      Inside = false;
    }
    touchArr = (boolean[])append(touchArr, Inside);
  }
  for (i=0; i<touchArr.length; i++){
    if (touchArr[i] == true){
      check_touch = true;
    }
  }
  if (check_touch == true){
    return Touching = true;
  }else{
    return Touching = false;
  }
}


void drawArray(){
  for (int i=0; i<height; i+=200){
    for (int j=0; j<width; j+=200){
      
      pushMatrix();
      
      Window window = new Window();
      Door door = new Door();
      Lite lite = new Lite();
      House thisHouse = new House(100,100,100,100,window,door,lite);
      
      translate(j,i);
      
      collision = ShapeCollision(window.getArray(), door.getArray(), lite.getArray());
      println("Collision? " + collision);
      
      while(collision){
      println("RETRY");
      window = new Window();
      door = new Door();
      lite = new Lite();
      thisHouse = new House(100,100,100,100,window,door,lite);
      collision = ShapeCollision(window.getArray(), door.getArray(), lite.getArray());
      } 
      
      if (!collision){
        thisHouse.drawHouse();
        println("They didn't touch");
      }
      
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



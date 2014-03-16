int [] col = {0,0,0,0};

void setup(){
  size(1000,1000);
  background(253,237,9);
  noStroke();
  noLoop();
}

void draw(){
  int i=0;
  int j=0;
  for(i=0; i<=height; i+=200){
    for(j=0;j<=width;j+=200){
      pushMatrix();
      translate(j,i);
      drawRec(0,0,100,6, new int []{234,13,92,200});
      translate(j+150,i+100);
      drawRec(0,0,100,6, new int [] {245,84,25,200});
      popMatrix();
    }
  }
}
  
void drawRec (int x, int y, int h, int level, int [] col){
  //int col = int(random(255)) - level;
  fill(col[0],col[1],col[2],col[3]);
  rect(x,y,h,h);
  if(level>1){
    level = level -1;
    //huge complexity possible through varying x/y modifiers!!
    drawRec(x-h/2,y-h/2,h/2,level, col);
    drawRec(x+h/2,y-h/2,h/2,level, col);
  }
}
  
void keyPressed(){
    int j = 0;
    if (keyCode == ENTER){
      saveFrame("output"+j+".jpg");
      j = j+1;
        }
      }

void setup(){
  size(1000,1000);
  background(255);
  noStroke();
  noLoop();
}

void draw(){
  int i=0;
  int j=0;
  for(i=0; i<height-100; i+=200){
    for(j=0;j<width+100;j+=200){
      pushMatrix();
      translate(j,i);
      drawRec(0,0,100,6);
      popMatrix();
    }
  }
}
  
void drawRec (int x, int y, int h, int level){
  int col = int(random(255)) - level;
  fill(61,55,206,200);
  rect(x,y,h,h);
  if(level>1){
    level = level -1;
    //huge complexity possible through varying x/y modifiers!!
    drawRec(x-h/2,y-h/2,h/2,level);
    drawRec(x+h/2,y-h/2,h/2,level);
  }
}
  
void keyPressed(){
    int j = 0;
    if (keyCode == ENTER){
      saveFrame("output"+j+".jpg");
      j = j+1;
        }
      }

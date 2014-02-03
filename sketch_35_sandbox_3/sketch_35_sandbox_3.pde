void setup(){
  size(1150,1150);
  noStroke();
  noLoop();
}

void draw(){
  int i=0;
  int j=0;
  for(i=0; i<height-150; i+=300){
    for(j=0;j<width+150;j+=300){
      pushMatrix();
      translate(j,i);
      drawCircle(0,150,6);
      popMatrix();
    }
  }
}

void drawCircle(int x, int radius, int level){
  float tt = 126 * level/4.0;
  fill(tt,45,96,100);
  ellipse(x,150, radius*2, radius*2);
  if (level>1){
    level = level - 1;
    drawCircle(x - radius/2, radius/2, level);
    drawCircle(x+radius/2, radius/2, level);
  }
}

void keyPressed(){
    int j = 0;
    if (keyCode == ENTER){
      saveFrame("output"+j+".jpg");
      j = j+1;
        }
  }

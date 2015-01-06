void setup() {
  size(2000,1000);
}

void draw(){
  background(255);
  drawCircle(0,0,1000);
}

void drawCircle( float x, float y, float radius){
  stroke(0);
  noFill();
  ellipse(x,y,radius, radius);
  if( radius>5){
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x*2, y+radius, radius/2);
    drawCircle(x*2, y-radius, radius/2);
  }
}

void keyPressed(){
  int l =1;
  if (keyCode == ENTER){
    saveFrame("output"+l+".jpg");
   l = l+1;
  }
}

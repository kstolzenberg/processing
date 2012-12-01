int diam  = 10;
float centX, centY;

void setup(){
  size(500, 500);
  frameRate(24);
  smooth();
  background(255);
  centX = width/2;
  centY = height/2;
  stroke(80);
  strokeWeight(1);
  fill(255,40);
}
  
void draw(){
  if (diam <=400){
    //background(180);
    ellipse(centX, centY, diam, diam);
    diam +=10;
  }
}

//to screencap all frames
void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("screen-##.jpg");
  }
}
  


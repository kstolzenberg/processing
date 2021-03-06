float xstart, xnoise, ynoise;

void setup() {
  size(1000,1000);
  smooth();
  background(255);
  strokeWeight(1);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y<=height; y+=5){
    ynoise+=0.1;
    xnoise = xstart;
    for (int x = 0; x<=width; x+=5){
      xnoise +=0.1;
      drawPoint(x,y,noise(xnoise, ynoise));
    }
  } 
}



void draw(){
}

void drawPoint(float x, float y, float noiseFactor){
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor*radians(360));
  stroke(0,120);
  ellipse(0,0,50,20); 
  //this can change to be line, rec, circle etc
  popMatrix();
  }


void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("screen-##.jpg");
  }
  
}

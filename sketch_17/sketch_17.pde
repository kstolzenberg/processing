float xstart, xnoise, ynoise;

void setup() {
  size(2000,2000);
  smooth();
  background(255);
  strokeWeight(.5);
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
  stroke(104,35,0);
  rect(0,0,20,5);
  popMatrix();
  }


void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("screen-##.jpg");
  }
  
}

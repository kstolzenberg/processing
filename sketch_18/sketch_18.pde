float xstart, xnoise, ystart, ynoise;


void setup(){
  size(500,500);
  smooth();
  background(0);
  frameRate(24);
  
  xstart=random(10);
  ystart=random(10); 
}


void draw(){
  background(0);
  
  xstart+=10;
  ystart+=10;
  //speed control
  
  xnoise=xstart;
  ynoise=ystart;
  
  for (int y=0; y<=height; y+=5){
    ynoise +=0.1;
    //size control
    xnoise= xstart;
    for (int x=0; x<=width; x+=5){
      xnoise +=0.1;
      //size control
      drawPoint(x,y,noise(xnoise,ynoise));
  }
 }
}


void drawPoint(float x, float y, float noiseFactor){
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor*radians(540));
  noStroke();
  float edgeSize = noiseFactor*35;
  float grey = 150 + (noiseFactor*120);
  float alph = 150 + (noiseFactor*120);
  fill(grey, alph);
  ellipse(0,0,edgeSize,edgeSize/2);
  popMatrix();
}

void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("noise-##.jpg");
  }
}

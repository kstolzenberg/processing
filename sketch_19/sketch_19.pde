float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise;


void setup(){
  size(500,500);
  smooth();
  background(0);
  frameRate(24);
  
  xstartNoise=random(20);
  ystartNoise=random(20);
  xstart=random(10);
  ystart=random(10); 
}


void draw(){
  background(255);
  
  xstartNoise+=0.01;
  ystartNoise+=0.01;
  xstart+=(noise(xstartNoise)*0.5)-0.25;
  ystart+=(noise(ystartNoise)*0.5)-0.25;
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
  rotate(noiseFactor*radians(360));
  stroke(0,150);
  line(0,0,20,0);
  popMatrix();
}

void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("noise-##.jpg");
  }
}

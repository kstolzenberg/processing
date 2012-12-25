int _grow = -100;
float xstart, ystart; 
float[] branch1;
float[] branch2;

void setup(){
  size(500,500);
  background(255);
  stroke(0);
  strokeWeight(1);
  xstart = 0;
  ystart = 400;
}


void draw(){
  float [] branch1 = {xstart , ystart + _grow*2};
  float [] branch2 = {branch1[0] + _grow, branch1[1] + _grow};
  line(xstart, ystart, branch1[0], branch1[1]);
  line(branch1[0],branch1[1], branch2[0], branch2[1]);
  line(branch1[0], branch1[1] , -1*branch2[0], branch2[1]);
  
}

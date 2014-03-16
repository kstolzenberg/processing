int i = 0;
int j = 0;
float r1,r2;

void setup(){
  size(1000,1000);
  background(255);
  smooth();
  noStroke();
  fill(0);
}

void draw(){
  float radius = 2;
  for(i=1; i<=width;i+=radius*2){
    for(j=1; j<=height; j+=radius*2){
      radius++;
      ellipse(i,j,radius,radius);
    }
  }
}


void keyPressed(){
  if(keyCode==ENTER){
    saveFrame("output.jpg");
  }
}

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

/*void draw(){
  float radius = 5;
  for(int i=0; i<width; i+=radius/2){
    for(int j=0; j<height; j+=radius/2){
      float size = (random(radius*2));
       fill(255);
       arc(random(i), random(j), size, size, random(PI*2), random(PI*2));
       fill(0);
       arc(random(i), random(j), size, size, random(PI*2), random(PI*2));
    }
  }
}*/

void draw(){
  float radius = 10;
  for(i=0; i<=width;i+=radius*2){
    for(j=0; j<=height; j+=radius*2){
      radius++;
      ellipse(i,j,radius,radius);
    }
  }
}

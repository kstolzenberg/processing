int _num=10;

void setup(){
size(800,800);
background(255);
smooth();
strokeWeight(1);
drawCircles();
}

void draw(){

}

void mouseReleased(){
  drawCircles();
}

void drawCircles(){
for (int i=0; i<_num; i++){
  float x = random(width);
  float y = random(height);
  float radius = random(100) + 10;
  float c1 = random(255);
  float c2 = random(255);
  float c3 = random(255);
  float cA = random(25,255);
  fill(c1,c2,c3,cA);
  noStroke();
  ellipse(x, y, radius*2, radius*2);

  }
}


void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("screen-####.jpg");
  }
}

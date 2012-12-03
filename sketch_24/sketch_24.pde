int _num = 10;

void setup() {
  size(500,500);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150,50);
  drawCircles();
}

void draw(){
}

void mouseReleased(){
  drawCircles();
}

void drawCircles(){
  for (int i = 0; i< _num; i++){
    float x = random(width);
    float y = random(height);
    float radius = random(100) + 10;
    ellipse(x,y,radius*2,radius*2);
    stroke(0,150);
    ellipse(x,y,20,20);
    ellipse(x,y,40,40);
    ellipse(x,y,80,80);
  }
}



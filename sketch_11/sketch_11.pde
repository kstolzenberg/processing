int _num=10;

void setup(){
size(500,500);
background(255);
smooth();
strokeWeight(.25);
stroke(20,20);
drawCircles();
}

void draw(){

}

void mouseReleased(){
  drawCircles();
}

void drawCircles(){
  for (int i=0; i<_num; i++){
    float radius = random(250);
    float centX=random(500);
    float centY=random(500);

    for(float ang = 0; ang<=360; ang += 1){
  
    float rad = radians(ang);
    float x1 = centX+(radius*cos(rad));
    float y1 = centY+(radius*sin(rad));
  
    float opprad = rad + PI;
    float x2 = centX + (radius*cos(opprad));
    float y2 = centY + (radius*sin(opprad));
 
    line(x1, y1, x2, y2); 
    }
  }
}


void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("screen-####.jpg");
  }
}

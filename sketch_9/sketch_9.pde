size(500,500);
background(255);
strokeWeight(.5);
stroke(40,50);
smooth();

float radius = width/2;
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

saveFrame("screen-####.jpg");

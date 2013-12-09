int j = 1;
int i,k;
float x, y, r,b;

//could also make each subsequent one aware of previous color by storing in an array and pulling property info

void setup() {
  size(1000, 1000);
  background(255);
  smooth();
  noStroke();
}

void draw(){
}

void drawRec() {
  for (k=1;k<5;k++){
    x = random(width);
    y = random(height);
    r = random(255);
    b = random(255);
    for (i=0;i<12;i++) {
      pushMatrix();
      translate(x,y);
      rotate(radians(30*i));
      fill(r,50+i*20,b);
      rect(0,0,100,25);
      popMatrix();
    }
  }
}

void mouseReleased(){
  drawRec();
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("output"+j+".jpg");
    j = j+1;
  }
}


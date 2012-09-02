int diam  = 10;
float centX, centY;

void setup(){
  size(500, 500);
  frameRate(24);
  smooth();
  background(194,250,176);
  centX = width/2;
  centY = height/2;
  stroke(220,170,50);
  strokeWeight(5);
  fill(194,250,176,25);
}
  
void draw(){
  if (diam <=400){
    background(194,250,176);
    strokeWeight(5);
    fill(194,250,176,25);
    ellipse(centX, centY, diam, diam);
    
    strokeWeight(0);
    noFill();
    int tempdiam = diam;
    while (tempdiam > 10) {
      ellipse(centX, centY, tempdiam, tempdiam);
      tempdiam -=10;
    }
    
    diam +=10;  
    
  }
}

//to screencap all frames
void keyPressed(){
  if (keyCode == ENTER){
  saveFrame("screen-##.jpg");
  }
}
  

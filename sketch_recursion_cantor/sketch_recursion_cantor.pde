void setup() {
  size(1000,300);
}

void draw(){
  background(255);
  strokeWeight(1);
  cantor(10,20,width-20);
}

void cantor(float x, float y, float len){
  if(len >=1){
  line(x,y,x+len,y);
  y+=20;
  cantor(x,y,len/3);
  cantor(x+len*2/3,y,len/3);
  }
}

void keyPressed(){
  int l =1;
  if (keyCode == ENTER){
    saveFrame("output"+l+".jpg");
   l = l+1;
  }
}

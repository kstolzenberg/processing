//MAKE RECURSIVE SUBSTRATE FROM SCRATCH!
int i, j;
int k = 50;
int l = 100;

void setup(){
  size(500,500);
  background(255);
  strokeWeight(3);
  smooth();
}

void draw(){
  for(i=0;i<=width;i+=k){
    for(j=0; j<=height; j+=l){
      line(i+i/2,k+i,j+j/2,l+j);
      rect(i,j,k,l);
    }
  }
}

void keyPressed(){
  if(keyCode==ENTER){
    saveFrame("output.jpg");
  }
}

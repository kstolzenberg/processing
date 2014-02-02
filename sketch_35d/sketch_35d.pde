//MAKE RECURSIVE SUBSTRATE FROM SCRATCH!
int i, j;
int k = 50;
int l = 100;

void setup(){
  size(500,500);
  background(255);
  stroke(1);
  smooth();
}

void draw(){
  for(i=0;i<=width;i+=k){
    for(j=0; j<=height; j+=l){
      line(i+i/2,k,j+j/2,l);
      rect(i,j,k,l);
    }
  }
}

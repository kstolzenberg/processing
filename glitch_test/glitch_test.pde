PImage lever;
void setup(){
  size(500,500);
  lever = loadImage("LEVER.jpg");
  int dimension = lever.width*lever.height;
  lever.loadPixels();
  //int seed = int(random(lever.pixels));
  for(int i=0; i<dimension;i+=24){
    //seed = int(random(lever.pixel));
    lever.pixels[i]=i*int(random(dimension));
    }
    //set(i,i,ran);
    //int j =int(random(500));
    //too uniform - pick random pixeks and add random numbers? 
    //lever.pixels[i]= lever.pixels[i]+j;
    //note this accesses a specific pixel location...look at methods!
  
  lever.updatePixels();
}

void draw(){
  background(0);
  image(lever,0,0);
}

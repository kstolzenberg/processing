PImage lever;
void setup(){
  size(500,500);
  lever = loadImage("LEVER.jpg");
  int dimension = lever.width*lever.height;
  lever.loadPixels();
  for(int i=0; i<dimension;i+=24){
    int ran = int(random(24));
    //lever.pixels[i+ran] = color(0);
    String j = "&&&&&&&";
    println(lever.pixels[4]);
    //lever.pixels[i]= lever.pixels[i]+j;
    //note this accesses a specific pixel location...look at methods!
  }
  
  lever.updatePixels();
}

void draw(){
  background(0);
  image(lever,0,0);
}

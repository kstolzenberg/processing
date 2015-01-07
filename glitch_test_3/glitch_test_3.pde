PImage lever;
int i;

void setup(){
  size(500,500);
  lever = loadImage("LEVER.jpg");
  int dimension = lever.width*lever.height;
  lever.loadPixels();
  int ran_count = 50;
  int [] ran_position = {};
  
  //read image as string array
  String all_pixels[] = loadStrings("LEVER.jpg");
  
  //make array of random values to use as positions
  while (ran_position.length < ran_count){
  int ran = int(random(all_pixels.length));
  ran_position = append(ran_position, ran);
  }
  //println(ran_position);
  
  //for each random position, mess with the pixels
  for(i=0; i<ran_position.length; i++){
    all_pixels[i] = all_pixels[i] + "&%$$$**";
  }
  println(all_pixels);
  
  //rewrite image? idk if this will work switching, how make pixels_image from the string? lets pause this.
  lever.updatePixels();
} 

void draw(){
  background(0);
  image(lever,0,0);
}

PImage lever;
void setup(){
  size(500,500);
  lever = loadImage("LEVER.jpg");
  int dimension = lever.width*lever.height;
  lever.loadPixels();
  int ran_count = 50;
  int [] ran_position = {};
  
  //make array of random values to use as positions
  while (ran_position.length < ran_count){
  int ran = int(random(dimension));
  ran_position = append(ran_position, ran);
  }
  println(ran_position);
  String all_pixels[] = loadStrings("LEVER.jpg");
  println(all_pixels);
  
  //loop through random positions and fux with pixels
  //for(i=0; i<ran_position.length; i++){
    
  
  lever.updatePixels();
} 

void draw(){
  background(0);
  image(lever,0,0);
}

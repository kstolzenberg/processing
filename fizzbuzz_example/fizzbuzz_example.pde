//fizz buzz quick challenge in Processing

int i;
//make it empty first
String [] fizzct = {};
String [] buzzct = {};

void setup(){
size(500,500);
fill(255);
noLoop();
}

void draw(){
  
  for(i=0; i<=100; i++){
    if(i % 3 == 0){
      //println("fizz");
      fizzct = (String [])append(fizzct, "fizz");
    } else if(i % 5 == 0){
      //println("buzz");
      buzzct = (String[])append(buzzct, "buzz");
    } else {
      //println(i);
    }
  }
  
  println("#fizz:" + fizzct.length);
  println("#buzz:"+buzzct.length);
}

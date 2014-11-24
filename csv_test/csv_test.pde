//read external text file, pull into array, split array values, convert to numbers
background(255,50);
size(2000,500);
int i;

String lines[] = loadStrings("test.csv");
//bc its an array, you have to select the first value to split!!! c/o shiffman
String values[] = split(lines[0],",");
println(lines);
println(values);
int [] data = int(values);
println(data);

for(i=0; i<data.length; i++){
  fill(256,43,56,100);
  rect(100,100,100*i,50*i);
  pushMatrix();
  translate(500,100);
  rotate(radians(30*i));
  text("derp",0,0);
  popMatrix();
}


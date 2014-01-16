float a,b,c,d,e,f;


size(1000,1000);
smooth();
stroke(0);
strokeWeight(6);
fill(200,254,168);
background(174,204,11);
a=0;
b=0;

for(b=0; b<height+50; b+=100){
  for(a=0; a<width+50; a+=100){
  beginShape(TRIANGLE_FAN);
  vertex(a,b);
  vertex(a+50,b);
  vertex(a, b+50);
  vertex(a-50,b);
  vertex(a,b-50);
  vertex(a+50,b);
  endShape();
}
}

fill(78,91,5);
strokeWeight(6);
for(b=0; b<height+50; b+=100){
  for(a=0; a<width+50; a+=100){
  pushMatrix();
  translate(50,50);
  ellipse(a,b,60,40);
  endShape();
  popMatrix();
}
}

saveFrame("tesellate4.jpg");



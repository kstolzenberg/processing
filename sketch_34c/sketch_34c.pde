float a,b,c,d,e,f;


size(1000,1000);
smooth();
stroke(0);
strokeWeight(7);
fill(200,254,168);
background(174,204,11);
a=0;
b=0;

for(b=0; b<height+50; b+=100){
  for(a=0; a<width+50; a+=100){
  beginShape(TRIANGLE_STRIP);
  vertex(a,b);
  vertex(a+10,b+50);
  vertex(a+20,b);
  vertex(a+30,b+50);
  vertex(a+40,b);
  vertex(a+50,b+50);
  vertex(a+60,b);
  vertex(a+70,b+50);
  vertex(a+80,b);
  vertex(a+90,b+50);
  endShape();
}
}

fill(78,91,5,150);
strokeWeight(3);
for(b=0; b<height+50; b+=100){
  for(a=0; a<width+50; a+=100){
  pushMatrix();
  translate(50,50);
    beginShape(TRIANGLE_STRIP);
      vertex(a,b);
      vertex(a+10,b+50);
      vertex(a+20,b);
      vertex(a+30,b+50);
      vertex(a+40,b);
      vertex(a+50,b+50);
      vertex(a+60,b);
      vertex(a+70,b+50);
  endShape();
  popMatrix();
}
}

saveFrame("tesellate4.jpg");



import processing.opengl.*;

size(500,500,OPENGL);
background(255);
stroke(255,127);
strokeWeight(1);
fill(80);
smooth();
sphereDetail(5);

translate(250,250,-150);
sphere(200);

saveFrame("screen-#.jpg");

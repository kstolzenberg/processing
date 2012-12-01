import processing.opengl.*;

size(500,300,OPENGL);
background(240);
stroke(0,127);
strokeWeight(3);
fill(255,100);
smooth();
sphereDetail(5);

translate(250,150,-150);
sphere(200);

saveFrame("screen-##.jpg");

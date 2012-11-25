import processing.opengl.*;

size(500,300,OPENGL);
background(255);
stroke(0,127);
strokeWeight(.25);
fill(88,100);
sphereDetail(40);

translate(250,150,-150);
sphere(100);

saveFrame("screen-##.jpg");

import processing.opengl.*;

size(500,300,OPENGL);
sphereDetail(5);

translate(width/2,height/2);
sphere(100);

saveFrame("screen-####.jpg");

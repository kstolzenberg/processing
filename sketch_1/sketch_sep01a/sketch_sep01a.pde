//setup and background
size(500,300);
smooth();
background(80,100);

//draw two crossed lines
stroke(130,0,0);
strokeWeight(4);
float centX=width/2;
float centY=height/2;
line(centX-70,centY-70,centX+70,centY+70);
line(centX+70,centY-70,centX-70,centY+70);

//draw a filled circle as well
fill(255,150);
ellipse(width/2, height/2, 50, 50);


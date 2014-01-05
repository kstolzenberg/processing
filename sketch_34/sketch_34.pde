//quick way to create grid of objects without matrix

size(600,600);
noStroke();
background(75,48,200);

float x = 0;
float w = 38;
while (x < width+19){
  float y = 0;
  while (y < height+19){
    fill(256,60,10);
    ellipse(x,y,w,w);
    y = y+40;
  }
  x = x+40;
}

saveFrame("result.jpg");

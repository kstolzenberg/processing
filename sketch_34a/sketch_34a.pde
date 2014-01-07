float x,y;

void setup(){
size(1000,1000);
smooth();
stroke(56,10,9);
curveTightness(.4);
strokeWeight(5);
fill(240,85,54,200);
background(248,209,208);
}

void draw(){}

void mouseReleased(){
  drawLeaf();
}

void drawLeaf(){
beginShape();
float x = random(width);
float y = random(height);
vertex(x,y);
//curveVertex needs min 4 points
curveVertex(-200+x,400+y);
curveVertex(100+x,400+y);
curveVertex(100+x,200+y);
curveVertex(-200+x,200+y);
vertex(300+x,400+y);
endShape(CLOSE);

}

void keyPressed(){
   if (keyCode==ENTER){
   saveFrame("leaf.jpg");
   }
}

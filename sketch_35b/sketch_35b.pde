int randRange(int min_val, int max_val, int step){
  int count = (max_val - min_val) / step;
  return (int(random(0, count)) * step) + min_val;
}

void setup() {
  size(640, 360);
  background(51);
  noStroke();
  noLoop();
}

void draw() {
  println(randRange(0, 500, 5));
  println(randRange(0, 500, 5));
  println(randRange(0, 500, 5));
  println(randRange(0, 500, 5));
  println(randRange(0, 500, 5));
}


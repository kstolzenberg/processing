void setup() {
  size(1000, 1000);
  //background(251,96,36);
  background(23,192,204);
  noLoop();
}

void draw() {
  CA ca = new CA();
  while(ca.generation < height){
  ca.generate();
  ca.display();
  }
}


class CA {
  //data
  int[] cells;
  //rule #110
  //01101110
  int[] ruleset = {0, 1, 1, 1, 0, 1, 1, 0};
  int[] nextgen;
  int w = 10;
  int generation = 0;
  //constructor
  CA () {
    cells = new int[(width/w)];
    for (int i = 0; i<cells.length; i++) {
      //cells[i] = 0;
      //set to random initial conditions, rather than typ wolfram
      cells[i] = int(random(2));
    }
    //cells[cells.length/2] = 1;
  }
  //functionality
  void generate() {
    nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    generation++;
  }
     
    void display(){
    for (int i = 0; i <cells.length; i++) {
      if (cells[i] == 1) {
        fill(211,42,27);
      } else {
        fill(23,192,204);
      }
    noStroke();
    rect(i*w, generation*w, w, w);
    }
   }
   
    int rules(int a, int b, int c){
      String s = ""+a + b + c;
      int index = Integer.parseInt(s, 2);
      return ruleset[index];
     }
}

void keyPressed() {
  int l=0;
  if (keyCode == ENTER) {
    saveFrame("output"+8+".jpg");
    l = l+1;
  }
}

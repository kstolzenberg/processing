void setup() {
  size(500, 500);
  noLoop();
}

class CA {
  //data
  int[] cells;
  int[] ruleset;
  int w = 10;
  int generation = 0;

  //constructor
  CA () {
    int [] cells = new int[width/w];
    //Wolfram Rule 90
    int [] ruleset = {
      0, 1, 0, 1, 1, 0, 1, 0
    };
    //set middle as 1? yes all default = 0 except the center one bc standard wolfram model
    for (int i = 0; i<cells.length; i++) {
      cells[i] = 0;
    };
    cells[cells.length/2] = 1;
  }
  //functionality
  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i<cells.length-1; i++) {
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    generation ++;
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }

  for (int i=0; i<cells.length; i++) {
    if (cells[i] == 1) {
      fill(0);
    } 
    else { 
      fill(255);
    }
    rect(i*w, generation*w, w, w);
  }
}


void draw() {
  ca = new CA();
  ca.generate();
}


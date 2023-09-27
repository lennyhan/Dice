int[][] positions = {
  {20, 20},
  {10, 20, 30, 20},
  {20, 12, 10, 27, 30, 27},
  {10, 10, 30, 10, 10, 30, 30, 30},
  {10, 10, 30, 10, 10, 30, 30, 30, 20, 20},
  {10, 10, 20, 10, 30, 10, 10, 30, 20, 30, 30, 30}
};

int total = 0;

void setup() {
  size(540, 550);
  noLoop();
}

void draw() {
  background(107);
  total = 0;
  for (int x = 10; x < 520; x += 60) {
    for (int y = 10; y < 380; y += 60) {
      Die Roll = new Die(x, y);
      Roll.roll();
      Roll.show();
    }
  }
  fill(250);
  textSize(20);
  text("The total amount of all die incremented: "+total, 82, 500);
}

void mousePressed(){
  redraw();
}

class Die
{
  int myRoll, myX, myY;
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    myRoll = (int)(Math.random()*4)+1;
    total += myRoll;
  }
  void show()
  {
    stroke(0);
    fill(255);
    rect(myX, myY, 40, 40, 5);
    fill(0);
    int[] currentPositions = positions[myRoll - 1];

    for (int positionsIndex = 0; positionsIndex < currentPositions.length; positionsIndex += 2) {
      int xPosition = currentPositions[positionsIndex];
      int yPosition = currentPositions[positionsIndex + 1];
      ellipse(myX + xPosition, myY + yPosition, 5, 5);
    }
  }
}

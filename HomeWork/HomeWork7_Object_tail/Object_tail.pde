//Initilazing my arrays x and y 
//Declaring my declarations 
//This is just a small change
int num = 20;
int[] x = new int[num];
int[] y = new int[num];
int indexPos = 0;

Object[] Ellipses = new Object[num];

void setup() { 
  size(700, 700);
  noStroke();
  fill(255, 102);
  //The for-loop counts from 30 till the length of the array 
  for(int i = 0; i<num; i++){
    //Ellipse is initiz
    Ellipses[i] = new Object();
  }
}

void draw() {
  background(255);
  x[indexPos] = mouseX;
  y[indexPos] = mouseY;

  indexPos +=1;
  if (indexPos == num) {
    indexPos = 0;
  }

  for (int i = 0; i < num; i++) {
    
    //Using the modulus-function
    int pos = (indexPos+i) % num;
    Ellipses[i].display(x[pos], y[pos]);
    //small change
  }

  
}

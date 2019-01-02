class Flower {


  float r;        //radius
  int n_petals;
  float x;
  float y;
  int petalColor;
  int flowerxDir =1;
  int floweryDir =1;
  float xSpeed=2.8;
  float ySpeed=2.2;




  Flower (float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor) {
    r=temp_r;
    n_petals=temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
  }



  void display () {
    float ballX;
    float ballY;

    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {

      ballX=x+r*cos(i);
      ballY=y+r*sin(i);

      ellipse(ballX, ballY, r, r);
    }

    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }


  void topFlower() {
    if (  x>width-r || x<r) {
      flowerxDir*=-1;
    }
    if ( y>height-r || y<r) {
      floweryDir*=-1;
    }
  }

  void moveFlower() {
    x=x+(xSpeed*flowerxDir);
    y=y+(ySpeed*floweryDir);
  }
}

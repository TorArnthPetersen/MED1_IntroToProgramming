class Ball {

  int ellipseX;
  int ellipseY;
  int ellipseH;
  int ellipseW;
  int speed=1;

  int lives=5;
  int score=0;

  int ellipseXdir=2;
  int ellipseYdir=1;

  //All my declarions

  Ball (int temp_ellipseX, int temp_ellipseY, int temp_ellipseH, int temp_ellipseW) {

    ellipseX=temp_ellipseX;
    ellipseY=temp_ellipseY;
    ellipseH=temp_ellipseH;
    ellipseW=temp_ellipseW;
  }

  void display () {
    ellipse(ellipseX, ellipseY, ellipseH, ellipseW);
  }


  void moveBall() {
    ellipseX=ellipseX+ellipseXdir*speed;
    //I had to use float for both ellipseXdir and ellipse X, because int and floats can't be used in same equation 
    ellipseY=ellipseY+ellipseYdir*speed;
    //I added a new variable for the direction
  }

  void bounderiesBall() {
    if (ellipseX>width-ellipseW/2|| ellipseX<ellipseW/2)
      //"||" means OR, so if the condition is true the code will be executed.
      //
    {
      ellipseXdir=-ellipseXdir;
    }

    if (ellipseY>height-ellipseH/2 || ellipseY<ellipseH/2)
    {
      ellipseYdir=-ellipseYdir;
    }

    //Now rather than adding one to ellipseX each time we add ellipseXdir (the same with ellipseY) 
    //When ellipseXdir is negative we are  subtracting one from ellipseX.
  }

  boolean detectHit() {
    if (dist(mouseX, mouseY, ellipseX, ellipseY)<=ellipseH) 
      //dist calculates the distance two point using four variables
      //x and y of the mousePressd and ellipseX and ellipseY
      //this will make me able to set parameters of how far my mouseclick from what I define ("<=") my if() will be executed
    {
      speed=speed+1;
      return true;
      //You will get more points the higher
    } else {

      return false;
      // if the ellipse is not clicked you'll lose a life
    }
  }
}

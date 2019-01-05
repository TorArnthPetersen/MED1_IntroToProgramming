class Ball {

  //All variable-declarations

  int ellipseX, ellipseY, ellipseH, ellipseW;
  int speed=1;

  int lives=5;
  int score=0;
  int xDir= int(random(2,7)), yDir=1;

  // directional bufferes used to wait one frame before changing direction
  int xDirBuffer, yDirBuffer=0;  

  //The ball-class-constructor
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
    //I added a new variable for the direction
    ellipseX+=xDir*speed;
    ellipseY+=yDir*speed;
  }

  void bounderiesBall() {
    int r = ellipseH/2;
    int r1= ellipseW/2;

    // First check collition to the right side
    if (ellipseX > width-r) {
      ellipseX = width-r;
      xDir=-xDir;

      //then check if collision to the left side
    } else if (ellipseX < r ) {
      ellipseX = r;
      xDir=-xDir;
      //Then on the top of the canvas
    } else if (ellipseY > height-r1) {
      ellipseY = height-r1; 
      yDir=-yDir;

      //Then in the button of the canvas
    } else if (ellipseY<r1) {
      ellipseY = r1;
      yDir=-yDir;
    }
  }
  //This function has 3 parameters 
  boolean amICollidingWithOtherBall(int otherEllipseX, int otherEllipseY, int otherEllipseH) {
    //'dist()' checks the distance from 
    if (dist(ellipseX, ellipseY, otherEllipseX, otherEllipseY) < ellipseH/2 + otherEllipseH/2) {
      return true;
    } else {
      return false;
    }
  }
  // this function is triggered from main loop inside the main program, if this ball has hit another ball 
  void reverseDirectionNextFrame(int otherDirectionX, int otherDirectionY) { 

    // Goes back one step to avoid looped collision (still doesn't work perfectly)  
    ellipseX -= xDirBuffer;
    ellipseY -= yDirBuffer;

    // Puts the new direction into a buffer, which will be used next fra in by function 'evtChangeDirection() below'
    xDirBuffer = otherDirectionX; 
    yDirBuffer = otherDirectionY;
  }



  void evtChangeDirection() { 
    // if there is something in the direction buffer from previous frame 
    if (xDirBuffer != 0 && yDirBuffer != 0) { 

      // set the direction to the buffer
      xDir = xDirBuffer; 
      yDir = yDirBuffer;

      // and remove it
      xDirBuffer = 0; 
      yDirBuffer = 0;
    }
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

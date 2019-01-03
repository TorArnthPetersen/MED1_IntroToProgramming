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
        int r = ellipseH/2;
        int r1= ellipseW/2;
    
        // You need to check for collition on all sides of the box/frame
        // First check collition to the right side
    
        if (ellipseX > width-r) {
          ellipseX = width-r;
          ellipseXdir=-ellipseXdir;
    
          //then check if collision to the left side
        } else if (ellipseX < r ) {
          ellipseX = r;
          ellipseXdir=-ellipseXdir;
        } else if (ellipseY > height-r1) {
          ellipseY = height-r1;
          ellipseYdir=-ellipseYdir;
        } else if (ellipseY<r1) {
          ellipseY = r1;
          ellipseYdir=-ellipseYdir;
        }
      }
    //This function has 3 parameters 
      boolean amICollidingWithOtherBall(int otherEllipseX, int otherEllipseY, int otherEllipseH) {
        if (dist(ellipseX, ellipseY, otherEllipseX, otherEllipseY) < ellipseH/2 + otherEllipseH/2) {
          return true;
        } else {
          return false;
        }
      }
    
      void reverseDirectionNextFrame(int otherDirectionX, int otherDirectionY) { // this function is triggered from main loop, if this ball has hit another ball 
        ellipseX -= xDirBuffer; // Goes back one step to avoid looped collision (still doesn't work perfectly)
        ellipseY -= yDirBuffer;
        xDirBuffer = otherDirectionX; // Puts the new direction into a buffer which will be used next fra in by function 'evtChangeDirection() below'
        yDirBuffer = otherDirectionY;
      }
    
      int xDirBuffer = 0; // directional bufferes used to wait one frame before changing direction
      int yDirBuffer = 0;
    
      void evtChangeDirection() { 
        if (xDirBuffer != 0 && yDirBuffer != 0) { // if there is something in the direction buffer from previous frame 
          ellipseXdir = xDirBuffer; // set the direction to the buffer
          ellipseYdir = yDirBuffer;
          xDirBuffer = 0; // and remove it
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

//Ímporting sound-libary
import processing.sound.*;

// gameInstance is declared, and initialzed, with the argument 5
Game gameInstance = new Game(5); 
//Declaring 
SoundFile song;

void setup() {
  size(600, 400);
  //Initiliazing the soundfile
  //Loading a soundfile
  song = new SoundFile(this, "244004__mickleness__arcade-game-loop.mp3");
  // Play the file in a loop
  song.loop();
}

void draw() {
  background(random(255), random(255), random(255));
  textSize(24);
  fill(#FF0000);
  text(("Score="+gameInstance.score), 50, 20);
  //To keep track of score
  text("Lives="+gameInstance.lives, 50, 40);
  //To keep track of lives

  //The loop add the ball-class-methods to all the balls in the BallRow
  for (int i = 0; i < gameInstance.BallRow.length; i++) {
    gameInstance.BallRow[i].evtChangeDirection();
    gameInstance.BallRow[i].display();
    gameInstance.BallRow[i].moveBall();
    gameInstance.BallRow[i].bounderiesBall();
  }

  //This loop ensures that all the balls are checked for collision 
  //"For every i check every j"
  for (int i = 0; i < gameInstance.BallRow.length; i++) {
    for (int j = 0; j < gameInstance.BallRow.length; j++) {

      Ball thisBall = gameInstance.BallRow[i];
      Ball otherBall = gameInstance.BallRow[j];

      //Check if thisBall collides with otherBall (i and j)
      //j and i must be different, so it does not check the same ball
      if (thisBall.amICollidingWithOtherBall(otherBall.ellipseX, otherBall.ellipseY, otherBall.ellipseH) && i!=j ) {

        //If there is collision the direction of the balls colliding is changed
        thisBall.reverseDirectionNextFrame(otherBall.xDir, otherBall.yDir);
      }
    }
  }
}

// The mousePressed (built-in-function) is triggered whenever the mouse is pressed
// It is used to determine wether the user has hit within the paramteres of the balls
void mousePressed() {

  //The built-in 'loop()' makes sure mousePressed not only works once, but is looped
  loop();
  int p =0; 

  //The for-loop loops over the length of the 'BallRow' array
  for (int i=0; i<gameInstance.BallRow.length; i++) {

    //-And checks if the mouse hits the balls, using the method 'detectHit()'
    if (gameInstance.BallRow[i].detectHit()) {
      //If one of the balls is hit, the variable 'p' increments
      p++;
    }
  }
  //If the variable 'p' is greater or equal to 0, the variable score will set to 1,
  if (p>0) {
    if (gameInstance.score ==0) {
      gameInstance.score=1;
    } else {
      //The old 'score' is added to itself, which means the higher the 'score' the more is added to the current 'score'
      gameInstance.score+= gameInstance.score;
    }
    // The default is that variable 'lives' is minused by 1
  } else {
    gameInstance.lives--;
  }
  //The life()-method in the gameClass is updated 
  gameInstance.life();
}

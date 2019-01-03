Game gameInstance = new Game(5); 

//Ímporting sound-libary
import processing.sound.*;
//Declaring 
SoundFile song;

void setup() {
  size(600, 400);
  //Initiliazing the soundfile
    // Load a soundfile
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

/*
 Composite Objects
 An object can include several other objects. Creating such composite objects 
 is a good way to use the principles of modularity and build higher levels of 
 abstraction within a program.
 */
 
  for (int i = 0; i < gameInstance.BallRow.length; i++) {
    gameInstance.BallRow[i].evtChangeDirection();
    gameInstance.BallRow[i].display();
    gameInstance.BallRow[i].moveBall();
    gameInstance.BallRow[i].bounderiesBall();
  }


  for (int i = 0; i < gameInstance.BallRow.length; i++) {
    for (int j = 0; j < gameInstance.BallRow.length; j++) {

      Ball thisBall = gameInstance.BallRow[i];
      Ball otherBall = gameInstance.BallRow[j];
      if (thisBall.amICollidingWithOtherBall(otherBall.ellipseX, otherBall.ellipseY, otherBall.ellipseH) && i!=j ) {
        thisBall.reverseDirectionNextFrame(otherBall.ellipseXdir, otherBall.ellipseYdir);
      }
    }
  }
}

void mousePressed() {
  loop();
  int p =0; 
  for (int i=0; i<gameInstance.BallRow.length; i++) {
    if (gameInstance.BallRow[i].detectHit()) {
      p++;
    }
  }
  if (p>0) {
    if (gameInstance.score ==0) {
      gameInstance.score=1;
    } else {
      gameInstance.score+= gameInstance.score;
    }
  } else {
    gameInstance.lives--;
  }
  gameInstance.life();
}

class Game {
  Ball [] BallRow; 
  int score=0;
  int lives=5;
  boolean lost=false;

  //Game initializer 
   Game(int n_Ball) {
    BallRow = new Ball[n_Ball]; 
    for (int i=0; i<n_Ball; i++) {
      
      
      int ballRadius = int(random(10, 60));
      BallRow[i] = new Ball(int(random(ballRadius, 600)), int(random(ballRadius, 400)), ballRadius, ballRadius);
    }
  }

  void life() {


    if (lives<=0) {
      noLoop();
      lost=true;
      fill(125);
      text("GAME OVER - Click to Restart", width/3.5, height/2);
    }
    if (lost) {
      for (int i=0; i< BallRow.length; i++) {
        BallRow[i].speed=1;
      }
      lives=5;
      score=0;



      lost=false;

      //Will reset the game with the same speed of the ball and same amount of lives
    }
  }
}

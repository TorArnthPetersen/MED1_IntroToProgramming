class Game {

Ball [] BallRow; 

  
  int score=0;
  int lives=5;
 
  boolean lost=false;
  
  //Game initializer 
 public Game(int n_Ball){
   BallRow = new Ball[n_Ball]; 
   for (int i=0; i<n_Ball; i++) {
    BallRow[i] = new Ball(int(random(5,125)),int(random(5,150)),int(random(10,60)),int(random(10,60)));
  }
 }

  void life() {

    if (lives<=0) {
      noLoop();
      lost=true;
      textSize(20);
      fill(125);
      text("GAME OVER - Click to Restart", width/3.5, height/2);
      textSize(13);
    }
    if (lost==true) {
      lives=5;
      score=0;

      lost=false;

      //Will reset the game with the same speed of the ball and same amount of lives
    }
  }
}

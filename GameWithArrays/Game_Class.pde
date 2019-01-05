class Game {

  // The array BallRow is declared of the the type: Ball (being a composite data type) 
  Ball [] BallRow; 
  
  // 3 variables are declared
    int score=0;
    int lives=5;
    boolean lost=false;

  //Game initializer 
  //The Game-class-constructor, has one int paramter (n_Ball), which determines how many balls are initialized in the game
  Game(int n_Ball) {
    
    //The array BallRow is initialized. 
    // After the 'new'-operator the Array of objects BallRow is initialized, 
    // the amount of object is defined as the argument passed into the Game-constructor 
    BallRow = new Ball[n_Ball]; 
    
    //n_ball is now the length of the BallRow array
    for (int i=0; i<n_Ball; i++) {

      //The variable ballRadius is declared 
      int ballRadius = int(random(50, 60));
      
      //For every spot in the array BallRow an object Ball is created, from the Ball-class constructor
      //Which takes 4 paramteres: x and y for the balls starting position and height and width 
      // (which is the same in this case(ballRadius)) 
      BallRow[i] = new Ball(int(random(ballRadius, 600)), int(random(ballRadius, 400)), ballRadius, ballRadius);
    }
  }

  //The method void life() checks if the variable 'lives' turns 0, the game will stop
  //The score, lives and speed of the balls will also reset

  void life() {


    //Lost
    if (lives<=0) {
      noLoop();
      //If the variable 'live' turns 0, the boolean 'lost' is true, and the if(lost) runs
      lost=true;
      fill(125);
      text("GAME OVER - Click to Restart", width/3.5, height/2);
    }
    if (lost) {
      //The for-loops loops over the length of the array, and change the speed to 1
      for (int i=0; i< BallRow.length; i++) {
        BallRow[i].speed=1;
      }
      //The variable 'lives' and the variable 'score' is changed back to 5 and 0
      lives=5;
      score=0;
      
      
      //In order to restart the game again (and exit the loop), the boolean 'lost' is set back to false
      lost=false;
    }
  }
}

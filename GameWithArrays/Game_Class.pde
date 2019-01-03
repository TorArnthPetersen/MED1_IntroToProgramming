class Game {
  /*
   An array is a list of data. Each piece of data in an array 
   is identified by an index number representing its position in 
   the array. Arrays are zero based, which means that the first 
   element in the array is [0], the second element is [1], and so on. 
   the syntax for creating an array of custom objects. 

   */
  Ball [] BallRow; 
  int score=0;
  int lives=5;
  boolean lost=false;

  //Game initializer 
  /**
 * Multiple constructors
 * 
 * A class can have multiple constructors that assign the fields in different ways. 
 * Sometimes it's beneficial to specify every aspect of an object's data by assigning 
 * parameters to the fields, but other times it might be appropriate to define only 
 * one or a few.
 */

  Game(int n_Ball) {
    BallRow = new Ball[n_Ball]; 
    for (int i=0; i<n_Ball; i++) {


      int ballRadius = int(random(50, 60));
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

Game gameInstance = new Game(100);  //<>// //<>//



void setup() {

  size(600, 400);
  textSize(32);
 

}


void draw() {

  background(255);
  pushMatrix();
  fill(#FF0000);
  text(("Score="+gameInstance.score), 50, 20);
  //To keep track of score

  text("Lives="+gameInstance.lives, 50, 40);
  //To keep track of lives
  popMatrix();
  for (int i=0; i<gameInstance.BallRow.length; i++) {
    gameInstance.BallRow[i].display();
    gameInstance.BallRow[i].moveBall();
    gameInstance.BallRow[i].bounderiesBall();
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

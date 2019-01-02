class Object {

  int x;
  int y;
  int r =50;

  void display(float x, float y) {
    ellipseMode(CENTER);
    float p= random(0,255);
    noise(p);
    fill(p);
    ellipse(x, y, r, r);
  }
}

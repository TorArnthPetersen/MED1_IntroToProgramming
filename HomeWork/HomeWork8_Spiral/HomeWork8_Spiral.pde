void setup() {
  size(400, 500);
  background(255);
}
//All my declarations 
float theta =0;  //Angle
float r =30; //Radius
float x;
float y; 
float a = 20;
float t;

void draw() {

  //the variable q is a noise function with the argument t
  float q = noise(t)*a;

  //float b = map(r, 0, height, 20, 255);
  //float g = map(r, 0, width/2, 10, 255);

  float p = map(mouseX, 0, width, 0, 255); 
  //x and y are increasinly incrementing, which enables the ellipse to grow
  x = r*cos(theta);
  y = r*sin(theta);

  fill(0, 0, p);
  noStroke();
  ellipseMode(CENTER); 


  ellipse(x + width/2, y + height/2, q, q); 
  //Distance between each ellipse

  theta+=0.02;
  r+=0.05;
  t+=0.01;

  //println(g);
  //println(b);
}

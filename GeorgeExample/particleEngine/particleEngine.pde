PVector g = new PVector(0,.3);
ArrayList<Particle> particles;

void setup(){
  size(800,600);
  particles = new ArrayList<Particle>();
}


void draw(){
  background(255);
  
  particles.add(new Particle());
  
  for(int i = particles.size()-1;i>=0;i--){
    particles.get(i).display();
    particles.get(i).update();
    
    if(particles.get(i).isDead()){
      particles.remove(i);
    }
  }
}



class Particle{
  
  PVector pos;
  PVector vel;
  int life;
  float size;
  
  Particle(){
    pos = new PVector(mouseX, mouseY);
    vel = new PVector(random(-2,2), random(-2,0));
    life = 255;
    size = random(20,70);
  }
  
  void display(){
    fill(100,100);
    noStroke();
    ellipse(this.pos.x,this.pos.y, size, size);
  }
  
  void update(){
    pos.add(this.vel);
    vel.add(g);
    life -= 2;
  }
  
  boolean isDead(){
    if(this.life<=0){
      return true;
    }
    return false;
  }
}

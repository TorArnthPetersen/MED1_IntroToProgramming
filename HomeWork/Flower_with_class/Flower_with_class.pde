 Flower [] FlowerRow = new Flower [6]; 
 
 int n_flowers=FlowerRow.length;
 
 //Flower myFlower1;
 //Flower myFlower2;
 //Flower myFlower3;
 
  void setup (){
    size(600,600);
    background(255);
  

    int _r1 =40;
    int _petals=5;
    //float _x=width/2;
    float _y=height/2;
    int _pc=#FFA000;
    //int _pc1=#E7E817;
    //int _pc2=#D31DE0;
   
   float _fSpace = width/n_flowers;
   
   for (int i=0; i<n_flowers; i+=i){
     FlowerRow[i] = new Flower(_r1,_petals,_fSpace*i,_y,_pc);
     
   }
   
    //myFlower1= new Flower (_r1,_petals,_x,_y,_pc);
    //myFlower2= new Flower (_r1+40,_petals+5,_x-150,_y-150,_pc1);
    //myFlower3= new Flower (_r1+20,_petals+2,_x+100,_y+100,_pc2);
  }
   void draw (){
  //background (#43AF76);
  
  for (int i=0; i<n_flowers; i+=i){
  FlowerRow[i].display();
  }
  /*myFlower1.display();
  myFlower2.display();
  myFlower3.display();
  myFlower1.moveFlower();
  myFlower2.moveFlower();
  myFlower3.moveFlower();
  myFlower1.topFlower();
  myFlower2.topFlower();
  myFlower3.topFlower();
  */
  //noLoop();
   
   }

class Road {
  int xPos,xPos2, yPos, speedX, speedY; //global variables for class.
   PImage Rimage;
   PImage Palm;
   PImage Palm2;
   


  /*constructor of Road class with intialised variables assigned 
   to the starting position of the rectangle before it gets
   decremented*/
   
   
  Road() {
    xPos = width;
   xPos2 = width;
    yPos = 190;
  }  

  //function to make object of the white-rectangle with starting coordinates
  void roadMove() {
    fill(255);//white fill colour

    //rectangle using the global variables xPos and Ypos.
    rect(xPos, yPos, 75, 5);
  }

  /*This function decrements the x position of the white rectangle
   to simulate the illusion of a moving road.*/
  void DroadMove() {
    xPos -= 70;


    /*if the rectangle reaches below -90 on the x-axis
     than the x position of the rectangle gets placed
     back to the width of the window*/
    if (xPos <-90) {
      xPos = width;
    }
  }

//code for the rocks and other decorations; they work with a seperate decrement fucntion.
  void rock(){
    Rimage = loadImage("Rock.png");
    Palm = loadImage("palmtree_pj.png");
   Palm2 = loadImage("FSA_Palm_Tree.png");
     Palm.resize(50,50);
  image(Palm, xPos2-50 , 10);
  
   Palm2.resize(50,50);
  image(Palm2, xPos2+550 , 10);
  

  

  Rimage.resize(50,50);
  image(Rimage, xPos2 , 50);
  
  Rimage.resize(25,25);
  image(Rimage, xPos2 + 90 , 50);
  
  Rimage.resize(10,10);
  image(Rimage, xPos2 -100 , 50);
  
    Rimage.resize(10,10);
  image(Rimage, xPos2 -30 , 320);
  
     Rimage.resize(30,30);
  image(Rimage, xPos2 + 20 , 380);
  
   Rimage.resize(30,30);
  image(Rimage, xPos2 + 80 , 390);
  
  Rimage.resize(10,10);
  image(Rimage, xPos2 + 120 , 35);
  
  Rimage.resize(20,20);
  image(Rimage, xPos2+270 , 50);
  
   Rimage.resize(20,20);
  image(Rimage, xPos2-70 , 390);
  
   Rimage.resize(10,10);
  image(Rimage, xPos2-270 , 350);
  
  Rimage.resize(50,50);
  image(Rimage, xPos2-200 , 50);
  
  Rimage.resize(25,25);
  image(Rimage, xPos2 -160 , 50);
  
  Rimage.resize(10,10);
  image(Rimage, xPos2 -350 , 50);
  
    Rimage.resize(10,10);
  image(Rimage, xPos2 -280 , 320);
  
     Rimage.resize(30,30);
  image(Rimage, xPos2 -230 , 380);
  
   Rimage.resize(30,30);
  image(Rimage, xPos2 -170 , 390);
  
  Rimage.resize(10,10);
  image(Rimage, xPos2 - 130 , 35);
  
  Rimage.resize(20,20);
  image(Rimage, xPos2+20 , 50);
  
   Rimage.resize(20,20);
  image(Rimage, xPos2-320 , 390);
  
   Rimage.resize(10,10);
  image(Rimage, xPos2-330 , 350);
  
  
  }
 
 
 //seperate function to make rocks move at a slower pace. 
  void rockMove(){
    xPos2 -= 10;
    
    if (xPos2 <-800) {
      xPos2 = width+800;
    }
  }

  //function to call the object of Road.
  void drawRoad() {
    noStroke(); 
    fill(150);//grey fill colour for road.
    rect(0, 100, 640, 200);//rectangle used as a graphic for the road. 
    
    strokeWeight(5);
    stroke(255);
    line(0,300,640,300);
    line(0,100,640,100);
  }
}

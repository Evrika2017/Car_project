class Car {

  PImage Car; //calling the image for car from sketch folder.
  PImage GOimage;
  PImage D; //DYNAMITE
  PImage s; //sparks for dynamite
  
  float speedX, speedY, xPos, yPos; //unintialised variables for class.
  float targetSize = 60;
  
  GameMusic game; //instance of the music class in the car class.
  
  
  boolean playGameMusic = true;//standard music for the game
  boolean gameOverMusic = true;//music triggered at collision.
  boolean Boom = true;//sound effect.
  boolean Vroom = true;//engine sound effect.

  /*constructor of class car with intialised variables 
   containing speed constants and starting coordinates
   for the start of the program*/
  Car() {
    speedX = 15;
    speedY = 15;
    xPos = 50;
    yPos = 280;

    game = new GameMusic();
  }

  //constructor with parameters to create randomised spawning cars.
  Car(int x, int y, int xp, float yp) {
    speedX = x;
    speedY = y;
    xPos = xp;
    yPos = yp;
  }

  void makeCar(String CI) {
    imageMode(CENTER);
    Car = loadImage(CI);
    
    D = loadImage("DynamicDynamite.png");
    
     s = loadImage("sparks.png");
    
    
    
  }

  void showCar() {
    //calling the image in the draw with starting coordinates on top.
    image(Car, xPos, yPos);
    image(D, xPos-5, yPos-5);//clip art of live dynamite
    image(s, xPos-7, yPos-25); //flare for the dynamite
  }


  //------------------------------------------------------------------
  //keyboard controls for the car:

  // w = up, s = down, d = right, and a = left.

  void keyControl() {   
    if (keyPressed) {
      if ( key == 'd' || key == 'D') {
//        move();
        /*function to move the car right 
         is called in the if statement*/
      }
      if (keyPressed) {
        if ( key == 'w' || key == 'W') {
          moveUp();
          /*function to move the car up
           the window is called in the if statement*/
        }


        if (keyPressed) {
          if ( key == 's' || key == 'S') {
            moveDown();
            /*function to move the car down
             the window is called in the if statement*/
          }

          if (keyPressed) {
            if ( key == 'a' || key == 'A') {
//              moveBack();
              /*function to move the car in
               reverse gear is called in the if statement*/
            }


          }
        }
      }
    }
  }

  //------------------------------------------------------------------

  //functions to move the car via control scheme

  //function to increment the x coordinates of the car. 
  void move() {
    //set boundries to avoid the car moving right outside the window
    if (xPos < width -50) { 
      xPos += speedX;
    }
  }

  /*function to decrement the x coordinates of the car. 
   so it moves in reverse gear*/
  void moveBack() {
    //set boundries to avoid the car moving left outside the window
    if (xPos > 50) {
      xPos -= speedX;
    }
  }

  /*function to increment the y coordinates of the car.*/
  void moveUp() {
    //set boundries to avoid the car going above the window.
    if (yPos > 125) {
      yPos -= speedY;
    }
  }

  /*function to decrement the y coordinates of the car.*/
  void moveDown() {
    //set boudries to avoid the car going below the window.
    if (yPos < height-125) {
      yPos += speedY;
    }
  }
  //  boolean hitTest(int xPos, int yPos) { 
  //
  //    return (dist(width/2, width/2, xPos, yPos) < targetSize/2);
  //  } 

  void ObMove() { //function to make objects move to the opposite direction.
    xPos -= 5;
  }

  void blowUp() {
    game.Boom(this);//sound effect
 }



  //this is to car collision.
  boolean hitTest(int xpos, int ypos) { 
    return (dist(xPos, yPos, xpos, ypos) < targetSize/2); //this returns true if the bullet is in range of the target.
  }
}
/*this edition of the car project contains a 
 simple moving background, window boundries, and a
 object orientated structure*/

//you may need to download this code if it doesn't work in code circle.

//portrait of bin laden was drawn by me on microsoft paint and submited in http://www.pixilart.net/art/bin-laden-f11728d42c. Check it out!

//assests:
//sound effects found from http://soundbible.com
//image spirtes from http://opengameart.org, http://clubpenguin.wikia.com/wiki/File:Pyramid_Pin.PNG, http://pixeljoint.com/pixelart/76047.htm, & http://zs.ffshrine.org/four-swords-adventures/sprites.php,
//google images: some sprites were anonymous for some reason.

import ddf.minim.*;

Car car;
Road background;
Obstacles carObstacle1 ;
Obstacles [] ObstaclesArray = new Obstacles[6];// array of obstacles.
Obstacles OB;

//-----------------------------------------------

Timer timer = new Timer(); //timer object to give the player enough start up time to play the game and not be immediately crashed by obstacles.
GameMusic gameMusic = new GameMusic();

boolean playGameMusic = true;//standard music for the game
boolean gameOverMusic = true;//music triggered at collision.
boolean menuMusic = true;

//-----------------------------------------------

//music and sound:
boolean Boom = true;//sound effect.
boolean Vroom = true;//engine sound effect.
boolean allah = true;
boolean Siren = true;
boolean Victory = true;

//game states
int gameOn;

//-----------------------------------------------

//menu 
boolean userEnterPlaying = false;

PImage Bomb;
PImage BombD;
PImage BG;
PImage menuB;

PImage bomber;
PImage bomber2;

//easter eggs
PImage bin;
PImage cat;
PImage OBama;
PImage v;
PImage t1;
PImage t2;

int totalTime = 180;
int time;
int wait = 1000;


void setup() {

  size(640, 400);//window size.
  gameOn = 0; //start the game at zero with menu.


  //bomb logo for HUD
  Bomb= loadImage("cherrybomb.png");


  Bomb.resize(40, 40);
  imageMode(CENTER);



  time = millis();//store the current time to blow up.

  //making the car object
  car = new Car();
  car.makeCar("Car_Red_Front.png");


  carObstacle1 = new Obstacles(1, random(75, 325));


  //making object of the class.
  background = new Road();

  createImageArray();
  OB = (Obstacles)ObstaclesArray[0];
  OB.makeObstacle("car14.png");
}
int imageNumber = 3;
int index = 0; 

void draw() {

  if (gameOn == 0) {
    menu();
  }

  if (gameOn == 1) {
    game();
  }
  
}//end of draw


//function to create objects of obstacles, at random places.
void createImageArray() {

  for (int i =0; i< ObstaclesArray.length; i++) {
    Obstacles OB = new Obstacles(1, random(90, 300));
    ObstaclesArray[i] = OB;
  }
}

void menu() {
    background(0);
    

  
  t2 = loadImage("Logos/cooltext157733743073658.png");
  t2.resize(640,230);
  image(t2,width/2,height/2);
  
  
   t1 = loadImage("Logos/cooltext157733096542952.png");
   t1.resize(640,240);
  image(t1,width/2,height/2 - 100);
  
    menuB = loadImage("Logos/isis-parody-emgn-2.png");
  menuB.resize(155,60);
  image(menuB,width/2,height/2 +130);
   
  
//the bomber shadows in menu screen with aks------
  bomber = loadImage("menuSprite.png");           
  bomber2 = loadImage("menuSprite2.png");         
  
   bomber.resize(100,100);
   bomber2.resize(100,100);
  image(bomber,600,height - 55);
  image(bomber2,50,height - 55);
//------------------------------------------------
  
  //easter egg:
  if ( key == 'q' || key == 'Q') {
    
    cat = loadImage("Logos/Terrorist-cat.jpg");
    
    cat.resize(640,400);
    
    image(cat,width/2,height/2);
    
  }
//------------------------------------------------

if(menuMusic){
   gameMusic.menu(this);//calls the function to play normal game music.
     menuMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just plays the music normally
}



  fill(255);
  text("press r to start", 275, 375);
}

void game() {



  background(255, 200, 0);//yellow colour background
  fill(255, 0, 0); //white colour.


  image(Bomb, 30, 20);



  text("Muaqqat:", 50, 20 );//A timer hud to keep track of when to blow up.
  //  text("0:" + totalTime, 120, 20);
  text(totalTime + " thawani", 110, 20);
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  //calling functions for the moving background
  background.drawRoad();
  background.roadMove();
  background.DroadMove();


  //code for rock in the background.
  background.rock();
  background.rockMove();


  //function for game mechanics
  timer.showTimer();
  checkCarCollision();


  //function to make car visible
  car.showCar();
  //carObstacle1.carObstacle1.showCar();

  if (playGameMusic) {

    //if statement to trigger audio.

    gameMusic.stopMusic();
    
    gameMusic.Vroom(this);//sound effect
    Vroom = false;

    gameMusic.gameMusic(this);//calls the function to play normal game music.
    playGameMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just plays the music normally
  }

  //function to make obstacle visible

    if (timer.passedTime > 10000) { //if the time passes 3.5 seconds, start the code to iterate the array of obstacles 

    if (OB.xPos <= -150) {

      OB = (Obstacles)ObstaclesArray[index];
      OB.xPos = 750;
      imageNumber += 1;
      index += 1;
      OB.makeObstacle("car" + imageNumber + ".png");

      if (imageNumber == 7) { //play sound effect when police arrives.

        gameMusic.Siren(this);//sound effect
        Siren = false;
      }

      if (imageNumber == 5) {
        gameMusic.allah(this);//sound effect
        allah = false;
      }
      if (imageNumber == 10){
          gameMusic.ikilu(this);//sound effect
  
      }
     
       if (imageNumber == 14){
         imageNumber = 2;
        
      }

      if (index == 6) {
        index = 0;
      }
    }
    OB.showOstacle();
  }

PImage YWimage;
  //------------------------------------------------------------------------------------------------------
  //condition to blow upvand win the game.
  //check the difference between now and the previously stored time is greater than the wait interval
  if (millis() - time >= wait) {
    totalTime--;
    time = millis();//also update the stored time

    if (totalTime ==-1) {
      car.blowUp();
      
      gameMusic.stopMusic();//stop normal music
      gameMusic.stopEngine();

      gameMusic.Boom(this);//sound effect
      Boom = false;

      gameMusic.Victory(this);//play nasheed.
      gameOverMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just plays the music normally


      background.drawRoad();
      background.roadMove();
      showExplosion(car.xPos, car.yPos);

      YWimage = loadImage("Logos/cooltext159088647659090.png");
      v = loadImage("Logos/V.jpg");

      YWimage.resize(180, 100);
      imageMode(CENTER);


      image(v, width/2, height/2);
      image(YWimage, width/2, height/2 -150);
       

      noLoop();//stop the for loops on the arrays
    }
  }


  //function to call the operation to decrement the obstacle's x coordinates
  OB.ObMove();


  //function to call the control scheme for the car.
  car.keyControl();


  //function to make the ostacles loop through the window.
  carObstacle1.repeat();
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//code for the explosion gif
PImage SSimage;

void showExplosion(float a, float b) {//the float variables a and b, are used as coordinates to display the explosion right where the enemy is.
  SSimage = loadImage("pi5eXXkkT.png");//gif animation that plays when you explode.

  SSimage.resize(450, 250);
  imageMode(CENTER);

  image(SSimage, a, b);//image with dynamic coordinates to appear at the enemy's most recent position before death.
}




//code for the gameover title.

PImage GOimage;//game over title in arabic.

void checkCarCollision() {

  for (int i = ObstaclesArray.length-1; i>=0; i--) { // checking the collisions of the car.
    if (car.hitTest(round(OB.xPos), round(OB.yPos))) {

      gameMusic.stopMusic();//stop normal music
      gameMusic.stopEngine();

      gameMusic.Boom(this);//sound effect
      Boom = false;

      gameMusic.gameOver(this);//play nasheed.
      gameOverMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just plays the music normally


      background.drawRoad();
      background.roadMove();
      showExplosion(car.xPos, car.yPos);
      showExplosion(OB.xPos, OB.yPos);

      //calling the game over text:

      GOimage = loadImage("Logos/cooltext157793931427180.png"); //game over title
      bin = loadImage("Logos/Bin_Laden.png");
      bin.resize(300,160);
      
        GOimage.resize(360, 200); 
      imageMode(CENTER);

      image(GOimage, width/2, height/2);//coordinates of game over title.
      text("adghat R l 'iieadat tashghil", width/2 -75, height/2 + 75);

image(bin, 308, height/2 - 120);

      gameOn = 2; //game is now at gameover state.



    }
  }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//function to restart game:
void reset() {
timer.passedTime = 0; //timer for the cars to appear.
totalTime =180;
 OB.xPos = 750;
gameOn = 1;


}

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//self destruct button to end your life.
void keyPressed() { 

  //condition to restart:
  
  
  if (gameOn == 2){
    if ( key == 'r' || key == 'R') {
    reset();
    
    gameMusic.stopMusic();
    
    gameMusic.Vroom(this);//sound effect
    Vroom = false;

    gameMusic.gameMusic(this);//calls the function to play normal game music.
    playGameMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just plays the music normally
  }
  }
  
  if ( key == 'r' || key == 'R') {
    gameOn = 1;
  }




  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //condition to kill yourself:
  if ( key == 'b' || key == 'B') {

    car.blowUp();



    OBama = loadImage("Logos/quit.jpg");

    OBama.resize(320, 200);
    imageMode(CENTER);

    image(OBama, width/2 , height/2);



    noLoop();

    //assets to appear when you kill yourself:

    gameMusic.stopMusic();//stop normal music
    gameMusic.stopEngine();

    gameMusic.Boom(this);//sound effect
    Boom = false;

    gameMusic.gameOver(this);//play nasheed.
    gameOverMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just pla

    showExplosion(car.xPos, car.yPos);
  }
}
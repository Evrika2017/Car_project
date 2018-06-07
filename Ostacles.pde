/*next edition of the car project will 
 contain an array of obstacles the car must avoid*/
 
class Obstacles {
  
PImage enemies;
int speedX, speedY, xPos;
float yPos;
 float targetSize = 600;

  Obstacles(int xp, float yp) {
    xPos = xp;
    yPos = yp;

  }

  void makeObstacle(String OI) {
    
    imageMode(CENTER);
    enemies = loadImage(OI); //OI stands for obstacle image
  }
  
  
   void showOstacle() {
    //calling the image in the draw with starting coordinates on top.
    image(enemies, xPos, yPos);
  }

  
  void ObMove(){
    xPos -= 20;
  }
  
  void repeat(){
    
    if(xPos <= -150){
      xPos = width + 150;
    }
  
  }
    
    boolean hitTest(int xPos, int yPos) { 
    
      return (dist(0,0,xPos, yPos) <= targetSize/2); 
      
      

    }
    
  
  
}
  
  
class GameMusic {
  AudioPlayer player, player2, player3, player4;

  Minim minim;


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void gameMusic(Object Play) {


    try {
      minim= new Minim(Play);
      player=minim.loadFile("Music/GamePlay.mp3");//locate file
      player.play();//when opened play this
      player.loop();//play the track when it ends.
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   void gameOver(Object Play) {


    try {
      minim= new Minim(Play);
      player=minim.loadFile("Music/Game_Over.mp3");//locate file
      player.play();//when opened play this
      player.loop();//play the track when it ends.
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  void Victory(Object Play) {


    try {
      minim= new Minim(Play);
      player=minim.loadFile("Music/Victory.mp3");//locate file
      player.play();//when opened play this
      player.loop();//play the track when it ends.
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
  void menu(Object Play) {


    try {
      minim= new Minim(Play);
      player=minim.loadFile("Music/Menu.mp3");//locate file
      player.play();//when opened play this
      player.loop();//play the track when it ends.
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  void stopMusic(){
    player.close();
    minim.stop();
  }
  
  void stopEngine(){
 player2.close();
  }
  
  void stopAllah(){
    player3.close();
  }
    
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  
//sound effects:

void Boom(Object Play) {
    try {
      minim= new Minim(Play);
      player=minim.loadFile("Sound_effects/Boom.mp3");//locate file
      player.play();//when opened play this
    
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }
  
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  
  void Vroom(Object Play) {
    try {
      minim= new Minim(Play);
      player2=minim.loadFile("Sound_effects/Engine.mp3");//locate file
      player2.play();//when opened play this
      player2.loop();//play the track when it ends.
      player2.setGain(-10);
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  void allah(Object Play) {
    try {
      minim= new Minim(Play);
      player3=minim.loadFile("Sound_effects/Allahu Akbar.mp3");//locate file
      player3.play();//when opened play this
      player3.setGain(-5);
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------     
     void Siren(Object Play) {
    try {
      minim= new Minim(Play);
      player4=minim.loadFile("Sound_effects/Siren.mp3");//locate file
      player4.play();//when opened play this
      player4.setGain(-5);
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
     }
    
    void ikilu(Object Play) {
    try {
      minim= new Minim(Play);
      player4=minim.loadFile("Sound_effects/ikilu.mp3");//locate file
      player4.play();//when opened play this
      player4.setGain(5);
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
    
  }
  



}


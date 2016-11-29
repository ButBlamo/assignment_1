class Loading extends LoginGraphics
{
  //Background will fade
  float fade;
  
  
    //Default field
    Loading()
    {
      fade = 250;
      
    }
    
    boolean fading()
    {
      //Delay the program so the fade isn't instantaneous
      frameRate(1);
      
      //Slowly making screen turn to black  
      println(frameRate);
      
      while (fade != 0)
      {
        
        ///Do the same to background picture
        image(img, 0, fade);
        
        fade = fade - 10;
        
      }
      //Clear graphics
          graphics.beginDraw();
          graphics.clear();
          graphics.endDraw();
          
          frameRate(60);
          background(0);
          
          return true;
    }
}
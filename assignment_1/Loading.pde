//Practicing inheritance with this class
class Loading extends LoginGraphics
{
  //Background will fade
  PVector position;
  float theta;
  float speed;
  float radius;
  color c;
  
  //Text
  String loadingText;
  
  
    //Default field
    Loading()
    {
      position = new PVector(width / 2, height / 2);
      theta = 0;
      speed = 0.1;
      radius = width / 6;
      c = color(255);
      
      loadingText = "Please hold...";
      fill(0);
    }
    
    //Clearing screen
    boolean fading()
    {
      //Wait 2 seconds to allow user to read response
      delay(2000);
      //Clear graphics
      graphics.beginDraw();
      graphics.clear();
      graphics.endDraw();
         
      background(0);
          
      return true;
    }
    
    //Loading animation method
    void loadingLoop()
    {
      textSize(25);
      text(loadingText, position.x - 50, position.y - 50);
    }
}
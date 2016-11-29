//Practicing inheritance with this class
class Loading extends LoginGraphics
{
  //Background will fade
  PVector centerPosition;
  float x1, y1;
  float theta;
  float speed;
  float radius;
  color c;
  
  
  //Text
  String loadingText;
  
  
    //Default field
    Loading()
    {
      centerPosition = new PVector(width / 2, height / 2);
      theta = 0.1;
      speed = 0.1;
      radius = width / 4;
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
      text(loadingText, centerPosition.x - 100, centerPosition.y - 100);
      

        fill(255);
        x1 = centerPosition.x + radius * cos(theta);
        y1 = centerPosition.y + radius * sin(theta);
        
        ellipse(x1, y1, 25, 25);
        
        theta += speed;
      
    }
}
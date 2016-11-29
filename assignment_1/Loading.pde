//Practicing inheritance with this class
class Loading extends LoginGraphics
{
  //Background will fade
  PVector centerPosition;
  float x1, y1;
  float speed;
  float radius;
  color c;
  
  
  //Text
  String loadingText;
  
  
    //Default field
    Loading()
    {
      centerPosition = new PVector(width / 2, height / 2);
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
      background(0);
      stroke(c);
      textSize(25);
      text(loadingText, centerPosition.x - 100, centerPosition.y - 100);
      
      textSize(50);
      text("A", centerPosition.x, centerPosition.y);
      

        fill(255);
        x1 = centerPosition.x + radius * cos(thetaAdder);
        y1 = centerPosition.y + radius * sin(thetaAdder);
        
        ellipse(x1, y1, 25, 25);
        
        thetaAdder += speed;
      
    }
}
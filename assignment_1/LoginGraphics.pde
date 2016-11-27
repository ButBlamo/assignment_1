/*This class will create a background for the login screen. 
  It will allow an image to exist in the corners of the screen
  while providing an area for the login textbox
*/

class LoginGraphics
{
  //Scaling graphics based on screen size
  PVector scale;
  //Initialising PGraphics
  PGraphics graphics;
  //Image
  PImage img;
  
    //default field that will run on setup
    LoginGraphics ()
    {
      scale = new PVector(width/ 2, height / 2);
      
      //Image file loaded to PImage image
      img = loadImage("briefing.jpg");
      
      render();
    }
    
    //Function to render graphics, including background image
    void render()
    {
      //Loading image to full size
      image(img, 0, 0); 
      
      //Area for login text to appear generated
      graphics.beginDraw();
      graphics.background(0,200,0);
      graphics.endDraw();
      
      //Drawing created graphics with image()
      image(graphics, scale.x, scale.y);
    }
      
  
}//End class LoginGraphics
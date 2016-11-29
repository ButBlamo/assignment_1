class MainMenu
{
  //Scaling graphics based on screen size
  PVector scale;
  //Initialising PGraphics
  PGraphics menu;
  //Image
  PImage img;
  
    //Default constructor for main menu
    MainMenu()
    {
      //Using PVectors
      scale = new PVector(0 , 0);
      
      menu = createGraphics(width / 4, height);
      
      //Image file loaded to PImage image
      img = loadImage("briefing.jpg");
      
      render();
    }
    
    void render()
    {
      img.resize(width, height);
      //Loading image to scaled size
      image(img, 0, 0); 
      
      //Area for login text to appear generated
      menu.beginDraw();
      menu.background(0, 200, 0);
      menu.tint(255, 177);
      menu.endDraw();
      
      //Drawing created graphics with image()
      image(menu, scale.x, scale.y);
    }
}
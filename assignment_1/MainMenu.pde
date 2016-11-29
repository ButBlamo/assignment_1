class MainMenu
{
  //Scaling graphics based on screen size
  PVector scale;
  //Initialising PGraphics
  PGraphics menu;
  PGraphics rightMenu;
  //Image
  PImage img;
  
    //Default constructor for main menu
    MainMenu()
    {
      //Using PVectors
      scale = new PVector(0 , 0);
      
      menu = createGraphics(width / 4, height);
      rightMenu = createGraphics(width / 4, height / 2);
      
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
      menu.background(255);
      menu.tint(255, 177);
      menu.endDraw();
      
      rightMenu.beginDraw();
      rightMenu.background(0, 25, 0);
      rightMenu.tint(255, 177);
      rightMenu.endDraw();
      
      //Drawing created graphics with image()
      image(menu, scale.x, scale.y);
      image(rightMenu, width - width / 4, 0);
    }
}
//Global float for radar
float thetaLine = 0;
int i = 0;


class MainMenu
{
  //Scaling graphics based on screen size
  PVector scale;
  //Initialising PGraphics
  PGraphics menu;
  PGraphics rightMenu;
  //Image
  PImage img;
  
  
  //Radar variables
  float speed;
  int trailLength;
  float theta;
  PVector centerPos;
  PVector pos;
  float radius;
  color c;
  
  
  //Clock variables
  int h;
  int m;
  int s;
  
  
    //Default constructor for main menu
    MainMenu()
    {
      //Using PVectors
      scale = new PVector(0 , 0);
      
      menu = createGraphics(width / 4, height);
      rightMenu = createGraphics(width / 4, height - height / 4);
      
      //Image file loaded to PImage image
      img = loadImage("briefing.jpg");
      
      render();
      
      speed = 0.01;
      trailLength = 50;
      theta = 0.1;
      centerPos = new PVector((width - width / 4) + width / 8, 0 + height / 6);
      pos = new PVector();
      radius = width / 16;
      c = color(0, 0, 255);
      
      //Clock shenanigans
      h = hour();
      m = minute();
      s = second();
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
    
    
    void radar()
    {
      stroke(0, 0, 255);
      noFill();
      
      //Create circle
      ellipse(centerPos.x, centerPos.y, radius * 2, radius * 2);
      
      
      thetaLine = theta - (i * speed);
      stroke(c);
      pos.x = centerPos.x + sin(thetaLine) * radius;
      pos.y = centerPos.y - cos(thetaLine) * radius;
      line(centerPos.x, centerPos.y, pos.x, pos.y);
      
      i++;
      
      
    }
    
    
    void clock()
    {
      textAlign(RIGHT);
      text (h + ":" + nf(m, 2) + ":" + nf(s, 2), width - width / 8 + 100, height / 2);
    }
}
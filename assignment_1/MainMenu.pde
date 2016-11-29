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
  
  
  //Button variables
  float r1X;
  float r1Y;
      
  float r2X;
  float r2Y;
      
  float r3X;
  float r3Y;
  
  float rW;
  float rH;
  
  
    //Default constructor for main menu
    MainMenu()
    {
      //Using PVectors
      scale = new PVector(0 , 0);
      
      menu = createGraphics(width / 4, height);
      rightMenu = createGraphics(width / 4, height - height / 4);
      
      //Image file loaded to PImage image
      img = loadImage("briefing.jpg");
      
      if (preventMainMenuRedraw == 1)
      {
        render();
        
        preventMainMenuRedraw--;
      }
      
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
      
      
      //Button variables
      r1X = 0;
      r1Y = height / 4;
      
      r2X = 0;;
      r2Y = height / 2; 
      
      r3X = 0;
      r3Y = height - height / 4;
      
      //Width and height of rectangles
      rW = width / 4 - 50;
      rH = height / 6;
      
      
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
      textSize(35);
      textAlign(RIGHT);
      text (h + ":" + nf(m, 2) + ":" + nf(s, 2), width - width / 8 + 100, height / 2);
    }
    
    
    
    //Checking if mouse is over a button and if mouse is clicked
    void buttons()
    {
      //Checking if both mouse over certain rectangle and if mouse is pressed
      //Button 1
      if (mouseOverRect(r1X, r1Y, rW, rH))
      {
        if (mousePressed == true)
        {
          gameState = 1;
        }
        fill(255, 0, 0);
        
      }
      else
      {
        fill(0);
      }
      rect(r1X, r1Y, rW, rH);
      //Text
      textSize(rH / 4);
      text("Select a loadout", r1X, r1Y - 35);
      
      
      //Button 2
      if (mouseOverRect(r2X, r2Y, rW, rH))
      {
        if (mousePressed == true)
        {
          gameState = 2;
        }
        fill(255, 0, 0);
        
      }
      else
      {
        fill(0);
      }
      rect(r2X, r2Y, rW, rH);
      //Text
      text("See weapon stats", r2X, r2Y - 35);
      
      
      //Button 3
      if (mouseOverRect(r3X, r3Y, rW, rH))
      {
        if (mousePressed == true)
        {
          gameState = 3;
        }
        fill(255, 0, 0);
        
      }
      else
      {
        fill(0);
      }
      rect(r3X, r3Y, rW, rH);
      //Text
      text("Logout", r3X, r3Y - 35);
    }
    
    //Boolean function to check if mouse is over one of the buttons
    boolean mouseOverRect(float x, float y, float w, float h)
    {
      return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h );
      
    }
}
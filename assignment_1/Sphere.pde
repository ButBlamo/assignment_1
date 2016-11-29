//Make it so the program is eventually exited in the event a sphere is created
int timer = 0;

class Sphere 
{
  color c;
  PVector size;
  
  PImage img;
  
  
    //Default constructor
    Sphere()
    {
      //Image file loaded to PImage image
      img = loadImage("briefing.jpg");
      
      c = color(90);
      
      lights();
      
      size = new PVector(width / 2, height / 2);
      
      makeRotate();
    }
    
    void makeRotate()
    {
      img.resize(width, height);
      //Loading image to scaled size
      
      beginShape();
      texture(img);
      
      vertex(0, 0,  0, 0);
      vertex(width, 0, -1000,  0);
      vertex(0, height, -1000,  100);
      vertex(width, height, -1000,  100);
      
      endShape();
      
      fill(c);
      
      pushMatrix();
        
        translate(size.x, size.y, -500);
        
        rotateX(radians(frameCount * -3));
        rotateY(radians(frameCount * -3));
        
        sphereDetail(30);
        
        sphere(width / 6);
        
        popMatrix();
        
        timer++;
        if (timer == 300)
        {
          exit();
        }
    }
}
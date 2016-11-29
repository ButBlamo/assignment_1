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
      //Loading image to scaled size
      image(img, 0, 0); 
      
      fill(c);
      
      pushMatrix();
        
        translate(size.x, size.y, -500);
        
        rotateX(radians(frameCount * -3));
        rotateY(radians(frameCount * -3));
        
        sphereDetail(30);
        
        sphere(width / 6);
        
        popMatrix();
    }
}
/*This class will contain all the information relevant to the user logging
  in to the weapons system
*/
class LoginText
{
  //User inputted details
  String username;
  String password;
  
  //Graphic overlay location for text box
  PVector topLeft;
  //Bottom right PVector
  PVector bottomRight;
  
  Boolean isCorrect;
  
  
    //Create field. This field is for initial loading of usernames/passwords
    LoginText(String name, String passphrase)
    {
      this.username = name;
      this.password = passphrase;
      
      topLeft = new PVector(width / 4, height / 4);
      bottomRight = new PVector(width / 4, height / 4);
      
      //Call fxn for displaying "Enter user details..." text
      displayIntroduction();
    }//End field
    
    //Second field will deal with user input when they attempt to login
    LoginText(String name, String passphrase, Boolean validCheck)
    {
      this.username = name;
      this.password = passphrase;
      this.isCorrect = validCheck;
    }
    
    //Implement fxn displayIntroduction
    void displayIntroduction()
    {
      //Calculating bottom right
      bottomRight.add(topLeft);
      
      //Text size and colour
      textSize(35);
      fill(50);
      //Create string for easier writing the text() fxn
      String text = "Welcome to the Atracel super weapons ordering system. Enter your login credentials.";
      
      text(text, topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
      
      text("Username:", topLeft.x + 50, height / 2 + 60);
      text("Password:", topLeft.x + 50, height / 2 + 120);
      
    }
    
    String toString()
    {
      return username + "\t"
                      + password + "\t";
    }//End string conversion fxn
    
  
  
}
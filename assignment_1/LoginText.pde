/*This class will contain all the information relevant to the user logging
  in to the weapons system
*/
class LoginText
{
  //User inputted details
  String username;
  String password;
  
  Boolean isCredentialsCorrect = false;
  
  
    //Create field. This field is for initial loading of usernames/passwords
    LoginText(String name, String passphrase)
    {
      this.username = name;
      this.password = passphrase;
    }//End field
    
    //Second field will deal with user input when they attempt to login
    LoginText(String name, String passphrase, Boolean validCheck)
    {
    }
    
    
    String toString()
    {
      return username + "\t"
                      + password + "\t";
    }//End string conversion fxn
    
  
  
}
/*This class will contain all the information relevant to the user logging
  in to the weapons system
*/
class LoginText
{
  //User inputted details
  String username;
  String password;
  
  Boolean isCredentialsCorrect = false;
  
  
    //Create field
    LoginText(String name, String passphrase)
    {
      username = name;
      password = passphrase;
      
      ValidateInput();
    }
    
    Boolean ValidateInput()
    {
      
    }
  
  
}
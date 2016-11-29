//C15446648 Daniel Moloney oop assignment 1

//Create arraylist for holding "correct" usernames and passwords
ArrayList<LoginText> users = new ArrayList<LoginText>();

Loading loadsMenu;

void setup()
{
  size(1280, 720);
  
  //Load in once the values of the tsv users into arraylist users
  //Using setup prevents unnecessary repetition of code
  Table t = loadTable("users.tsv", "header");
  int rowCount = t.getRowCount();
  int row;
  
  //Declare and construct an object of class LoginGraphics
  LoginGraphics loginScreen = new LoginGraphics();
  
  //Initialising global variable loadsMenu (for use in draw / prevented framerate dip)
  loadsMenu = new Loading();
  
  //Make sure users arrayList is empty
  users.clear();
  
  //For loop. Will retrieve contents of table t
  for (row = 0; row < rowCount; row++)
  {
    //Inserting values into arrayList through use of LoginText field
    LoginText buffer = new LoginText(t.getString(row, "Username"), t.getString(row, "Password"));
    
    users.add(buffer);
  }
  
}

//Input validity checker for allowing user to progress past login screen
Boolean isInputCorrect = false;

//For allowing fading of images
Boolean imageGone = false;

//Loading screen variable to determine start/finish of loading screen
int loadingScreenCounter = 0;
//theta accumulator
float thetaAdder = 0.1;

//Gamestate will determine what screen is loaded
int gameState = 0;

int preventMainMenuRedraw = 1;

void draw()
{
  //Later on in the draw once the main menu is loaded we cant have the login screen looping every frame
  if (isInputCorrect == false)
  {
    text(inputs[0], width / 2 - 75, height / 2 + 60);
    text(inputs[1], width / 2 - 75, height / 2 + 120);
    
    //If enterCounter is equal to 2 then you know to call class that will check the table for validity
    if (enterCounter > 1)
    {
      //Make object to pass username and password values
      LoginText validity = new LoginText(inputs[0], inputs[1], isInputCorrect);
      
      //Call checkingInput
      isInputCorrect = validity.checkingInput();
      
      textSize(35);
      fill(50);
    }
  }
  else
  {
    //Remove login screen to allow for next screens
    if (imageGone == false)
    {
      //Remove image
      imageGone = loadsMenu.fading();
    }
    if (loadingScreenCounter < 300 && imageGone == true)
    {
      loadsMenu.loadingLoop();
      
      loadingScreenCounter++;
    }
    
    //Main screen menu object generated
    MainMenu mainScreen;
    
    //Move onto main menu now
    if (gameState == 0 && loadingScreenCounter == 300)
    {
        mainScreen = new MainMenu();
        
        mainScreen.radar();
        mainScreen.clock();
        mainScreen.buttons();
       
    }
    else if (gameState == 1 && loadingScreenCounter == 300)
    {
    }
    else if (gameState == 2 && loadingScreenCounter == 300)
    {
    }
    else if (gameState == 3 && loadingScreenCounter == 300)
    {
    }
  }
}



//String array for storing username and password input
String[] inputs = {"", "", ""};
//Will be my way of telling when to change the string to be edited
int enterCounter = 0;

/*All user input on the login screen will be dealt with here */
void keyPressed()
{
  //Using keyPressed to allow user to input details
  
  //Checking if enter has been pressed (increment enterCounter). Prevented null pointer exception
  if (key == ENTER && enterCounter < 2)
  {
    enterCounter++;
  }
  //Checking if user wants to delete an element
  else if (key == BACKSPACE)
  {
    //If length longer than 0 you can delete element
    if (inputs[enterCounter].length() > 0)
    {
      inputs[enterCounter] = inputs[enterCounter].substring(0, inputs[enterCounter].length() - 1);
    }
    else if (enterCounter > 0)
    {
      enterCounter--;
      inputs[enterCounter] = inputs[enterCounter].substring(0, inputs[enterCounter].length() - 1);
    }
    //Refresh screen if credentials not fully entered
    if (enterCounter < 2)
    {
      LoginGraphics refreshScreen = new LoginGraphics();
      LoginText refreshText = new LoginText();
    }
      
  }
  //Checking if user wants to delete all lines of text
  else if (keyCode == DELETE)
  {
    inputs[enterCounter] = "";
    
    LoginGraphics refreshScreen = new LoginGraphics();
    LoginText refreshText = new LoginText();
  }
  //Checking for any more special keyCode letters before adding value into input box
  //Tell code to not add anymore inputs once enterCounter is above 1
  else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && enterCounter < 2 && inputs[enterCounter].length() < 18 )
  {
    inputs[enterCounter] = inputs[enterCounter] + key;
  }
  
}//End fxn keyPressed
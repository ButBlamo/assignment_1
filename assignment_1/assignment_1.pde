//C15446648 Daniel Moloney oop assignment 1

//Create arraylist for holding "correct" usernames and passwords
ArrayList<LoginText> users = new ArrayList<LoginText>();

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
  
  //Make sure users arrayList is empty
  users.clear();
  
  //For loop. Will retrieve contents of table t
  for (row = 0; row < rowCount; row++)
  {
    //Inserting values into arrayList through use of LoginText field
    LoginText buffer = new LoginText(t.getString(row, 0), t.getString(row, 1));
    
    users.add(buffer);
  }
  
}

void draw()
{
  //Variable for holding if entered password was correct or not
  Boolean isInputCorrect = false;
  
  
}
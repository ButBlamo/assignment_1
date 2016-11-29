class BarChart
{
  String noSold;
  String month;
  
  
    BarChart(String sold, String mon)
    {
      this.noSold = sold;
      this.month = mon;
      
    }
    
    BarChart()
    {
    }
    
    
    String toString()
    {
      return noSold + "\t"
                    + month + "\t";
    }//End fxn toString()
}
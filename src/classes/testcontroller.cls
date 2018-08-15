public class testcontroller {
    public Integer numberZone { get; set;}
    public String timeZone;
    
    public testcontroller(){
        numberZone = 0;
        timeZone = '';
    }
    public void clickButton(){
        
    }
    
    public String getTimeZone(){
        Datetime now = Datetime.now();
        system.debug(numberZone);
        Integer offsetZone = numberZone * 3600000;
        Datetime timeOffset = now.addSeconds(offsetZone/1000);
        return  string.valueofGmt(timeOffset);  
        
    }
    
}
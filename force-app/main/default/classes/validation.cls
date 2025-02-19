public class validation {
public decimal sal {get;set;}
public decimal exp {get;set;}
public decimal bonus {get;set;}    
    public void validation(){
        if (exp!=null && exp>0){
            if (exp>5){
                sal=10000;
                bonus=sal*0.5;
            }
            else{
                sal=5000;
                bonus=sal*0.2;
            }
             apexpages.Message n = new apexpages.Message(apexpages.Severity.CONFIRM,'succesfully entered');
            apexpages.addMessage(n);
        }
        else{
            apexpages.Message m = new apexpages.Message(apexpages.Severity.ERROR,'exp should be greater than 0');
            apexpages.addMessage(m);
        }
    }
}
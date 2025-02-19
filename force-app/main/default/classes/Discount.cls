public class Discount {    
    public void price(decimal p, decimal d){
        decimal a;
        decimal ta;
        a=((d/100)*p);
        ta=p-a;
        System.debug('ta= '+ta);        
    }
   }
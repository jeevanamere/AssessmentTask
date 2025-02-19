public class Balanceadded {
    integer am1;
    integer dr1;
    integer dr2;
    integer ad;
    public void add(integer am1, integer dr1, integer dr2, integer ad){
        integer ta;
        integer ta1;
        integer ta2;
        ta = am1-dr1;
        ta1=ta-dr2;
        ta2=ta1+ad;
        system.debug('ta2= '+ta2);
        
    }
}
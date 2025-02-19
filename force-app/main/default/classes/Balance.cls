public class Balance {
    integer am1 = 50000;
    integer dr1;
    integer dr2;
    integer ta1;
    integer ta;
    public integer withdraw(integer dr1){        
        ta = am1-dr1;
        system.debug('ta= '+ta);
        return ta;
    }
    public integer withdraw1(integer dr2){
        integer ta1;
        ta1 = ta-dr2;
        system.debug('Hi ta1= '+ta1);
        return ta1;
    }
    public void withdraw(){
        integer ta2;
        ta2 = ta1 + 10;
    }

}
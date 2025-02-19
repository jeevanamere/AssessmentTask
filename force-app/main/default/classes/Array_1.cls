public class Array_1 {

    public integer[]x{set;get;}
    public integer[]y=new integer[5];
    public Array_1(){
        
        x=new integer[5];
        x[0]=10;
        x[2]=30;
        x[3]=17;
        x[4]=60;
        x[1]=100;
        x.add(25);
        x.add(14);
        x.add(1, 101);
        x.clear();   
        
    }
}
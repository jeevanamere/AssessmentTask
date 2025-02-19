public class wrapper_2 {
    public decimal sal{set;get;}
    public integer exp{set;get;}
    public wrapper_1 w1{set;get;}
    public wrapper_2(){
        w1=new wrapper_1();
        w1.name='name';
        w1.x=25;
        sal=10000;
         exp=6;
    }
}
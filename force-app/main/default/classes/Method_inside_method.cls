public class Method_inside_method {
    public Integer x{set;get;}
    public Integer y{set;get;}
    public Integer z{set;get;}
    public Integer a{set;get;}
    public void method_1(){
        x=10;
        y=20;
        method_2();
    }
    public void method_2(){
        z=15;
        a=30;
    }
}
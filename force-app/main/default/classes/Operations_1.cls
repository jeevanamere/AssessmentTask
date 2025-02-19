public class Operations_1 {
    public Integer x {set;get;}
    public Integer y {set;get;}
    public Integer z {set;get;}
    Public Void Add(){
        z=x+y;
    }
    Public Void sub(){
        z=x-y;
    }
    Public Void multi(){
        z=x*y;
    }
    Public Void Div(){
        z=x/y;
    }
    Public Void Clear(){
        x=null;
        y=null;
        z=null;
    }
}
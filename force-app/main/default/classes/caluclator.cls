public class caluclator {
public integer a {set;get;}
public integer b {set;get;}
public integer c {set;get;}
    public void add(){
        a=b+c;
    }
    public void sub(){
        a=b-c;
    }
    public void multi(){
        a=b*c;
    }
    public void clear(){
        a=null;
        b=null;
        c=null;
    }
}
public class trigger_example {
    public static void tri1(list<account> accounts){
        for (Account a : accounts){
        if (a.type == 'Prospect'){
        a.ownership='private';
        a.rating='very cold';
    }
  }
 }
}
trigger Accountcontactupdate on Account (after insert) {
    list<contact> conlist = new list<contact>();
    for(account acc:trigger.new){
        Decimal NumberofLocations = acc.Number_of_Locations__c;
        for(integer i=0;i<=NumberofLocations;i++){
            contact con = new contact();
            con.lastname = 'New Contact'+(i+1);
            con.AccountId = acc.id;
            conlist.add(con);
        }
    }
    insert conlist;

}
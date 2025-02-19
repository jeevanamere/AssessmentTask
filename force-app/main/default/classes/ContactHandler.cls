public class ContactHandler {
    public static void mtdName(List<Contact>Conlist){
        set<Id> idList = New set<Id>();
        List<Account> acList = New List<Account>();
        for(Contact con :conList){
            Id idL;
            idL = con.AccountId;
            idList.add(idL);
        }
        acList=[Select Id,Count_of_Contact__c from Account where Id =: idList];
        Integer count = [Select count() from contact where AccountId =: idList];
        for(Account ac: acList){
            
            ac.Count_of_Contact__c = count ;
        }
        Update acList;
    }

}
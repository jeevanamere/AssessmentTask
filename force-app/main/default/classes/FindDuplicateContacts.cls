public class FindDuplicateContacts {
    
    public static void updateDuplicate(){
        List<Contact> lstContacts = new List<Contact>();
        Map<String, String> keyVsOriCons = new Map<String, String>();
        Map<Id, Set<Id>> originalVsDups = new Map<Id, Set<Id>>();
        for(Contact con:[Select Id, FirstName, LastName, Email, Duplicate_Contact__c FROM Contact LIMIT 50000]){
            String key = con.FirstName+'-'+con.LastName+'-'+con.Email;
            if(keyVsOriCons != null && !keyVsOriCons.isEmpty() && keyVsOriCons.containsKey(key)){
                String originalCont = keyVsOriCons.get(key);
                if(originalVsDups != null && !originalVsDups.isEmpty() && originalVsDups.containskey(originalCont)){
                    originalVsDups.get(originalCont).Add(con.Id);
                }else{
                    originalVsDups.put(originalCont,new Set<Id>{con.Id});
                }
            }else{
                keyVsOriCons.put(key,con.Id);
            }
        }
        //Set<Id> dupConId = new Set<Id>();
        Set<Id> AllDupsCons = new Set<Id>();
        System.debug('maps---'+originalVsDups);
        for(Id conId :originalVsDups.keySet()){
            AllDupsCons.add(conId);
            AllDupsCons.addAll(originalVsDups.get(conId));
            //dupConId.addAll(originalVsDups.get(conId));
        }
        System.debug('AllDupsCons '+AllDupsCons);
        
        for(Contact con:[Select Id,Duplicate_Contact__c FROM Contact Where Id IN :AllDupsCons AND Duplicate_Contact__c = false]){
           con.Duplicate_Contact__c = true;
           lstContacts.add(con);
        }
        if(lstContacts != null && !lstContacts.isEmpty()){
            Database.update(lstContacts,false);
        }
        //System.debug('dupConId '+dupConId);
        //System.debug('dupConId size '+dupConId.size());
    }

}
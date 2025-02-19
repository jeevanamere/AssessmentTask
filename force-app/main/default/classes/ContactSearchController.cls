public class ContactSearchController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(string searchKey) {
        string searchKeyword = '%' + searchKey + '%';
        list<Contact> contactLst = new list<Contact>();
        for(contact conObj : [Select Id,Name,Email,FirstName,LastName,MobilePhone
                              From Contact
                              WHERE Name LIKE : searchKeyword]){
                                  contactLst.add(conObj);
                              }
        if(contactLst.size() == 0){
            throw new AuraHandledException('No Records Found..'); 
        }
        System.debug('contact list size::'+contactLst.size());
        return contactLst;
    }
}
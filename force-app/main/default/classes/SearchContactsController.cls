public with sharing class SearchContactsController {
    public SearchContactsController() {
        System.debug('Inside Constructor');

    }
    @AuraEnabled(cacheable=true)

    public static List<Contact> getContacts(String conName) {

     List<Contact> cntList = new List<Contact>();

        String conStr = '%'+conName+'%';

        try{

            cntList = [Select Id, Name, FirstName, LastName, Email, MobilePhone,MailingCountry,MailingState,MailingCity from Contact Where FirstName LIKE :conStr];  

            return cntList;

        } catch (Exception e) {

           

        }      

        return cntList;

    }
}
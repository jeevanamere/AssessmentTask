public with sharing class MyController {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [SELECT Id, Name, Email FROM Contact LIMIT 10];
    }
}
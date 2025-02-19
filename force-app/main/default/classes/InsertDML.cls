public class InsertDML {
    public static void sobjectAccount(){
        Account acc = new Account();
        acc.name = 'CloudFulcrum';
        acc.Phone = '420591';
        acc.AccountNumber = '123456';
        acc.Active__c = 'Yes';
        acc.Customer_Email__c = 'user@gmail.com';
        acc.SLA__c = 'silver';
        acc.SLASerialNumber__c = '147852';
        insert acc;
    }

}
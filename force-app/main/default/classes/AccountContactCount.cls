public class AccountContactCount {
	public static void updateAcc(){
	List<Account> accList = [Select Id, Name, Number_of_Contacts__c, (Select Id, Name from Contacts) from Account];
	for(Account acc : accList) {
		acc.Number_of_Contacts__c = acc.Contacts.size();
		}
	update accList;
	
	}
}
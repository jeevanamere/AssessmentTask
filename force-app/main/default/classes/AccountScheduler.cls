global class AccountScheduler implements Schedulable{
	 global void execute(SchedulableContext SC) {
      FetchAccounts fa = new FetchAccounts();
      fa.syncAccounts();
         
         List<Contact> ctList = new List<Contact>(); // To capture unique or original contacts
List<Contact> ctDupList = new List<Contact>(); // to capture duplicate contacts
Map<string, Contact> orgCtMap= new Map<string, Contact>(); // To hold original contacts by their email addresses
Map<string, List<Contact>> dupCtMap= new Map<string, List<Contact>>(); //  To hold duplicate contacts by their email addresses 
Set<string> emailSet = new Set<String>(); // To maintain the unique email addresses
for(Contact ct : [Select Id, email from Contact]){  
	if(!emailSet.contains(ct.email)){
		emailSet.add(ct.email);
		orgCtMap.put(ct.email, ct);
	}else{
		ctDupList.add(ct);
		if(dupCtMap.keySet().contains(ct.email)){
			dupCtMap.get(ct.email).add(ct);
		}else{
			List<Contact> ctMapList = new List<Contact>();
			ctMapList.add(ct);
			dupCtMap.put(ct.email, ctMapList);
		}
	}
	
}
System.debug(ctDupList.size());
for(String email : orgCtMap.keySet()){
		if(dupCtMap.keySet().contains(email)){
            
			System.debug(dupCtMap.get(email).size());
		   for(Contact ctS : dupCtMap.get(email)){
				System.debug('Original Contact ==> '+ orgCtMap.get(email) + ' Duplicate Contact ==> '+ ctS);
		   }
		}
}


   }
}
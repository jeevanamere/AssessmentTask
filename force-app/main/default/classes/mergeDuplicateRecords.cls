global class mergeDuplicateRecords implements Database.Batchable<SObject>  {
    
    
    global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator([Select Id, Email, (Select Id, WhoId from Tasks), (Select Id, WhoId from Events) from contact where Email != null]);
      }
    global void execute(Database.BatchableContext BC , List<contact> scope){
    Map<String,List<contact>> contactsMap = new Map<String,List<contact>>();

    for( contact l : scope ) {
        if( !contactsMap.containsKey( l.Email ) ) {
            contactsMap.put( l.Email, new List<contact>() );
        }

    contactsMap.get( l.Email ).add( l );
    }

        List<Event> eventsToUpdate = new List<Event>();
        List<Task> tasksToUpdate = new List<Task>();
        List<contact> contactsToDelete = new List<contact>();


        for( String email : contactsMap.keySet() ) {
            List<contact> contactsToMerge = contactsMap.get( email );
            if( contactsToMerge.size() > 1 ) {
                contact mastercontact = contactsToMerge[0];

                for( Integer i = 1; i < contactsToMerge.size(); i++ ) {
                    contact mergedcontact = contactsToMerge[i];
                    for( Task t : mergedcontact.Tasks ) {
                        t.WhoId = mastercontact.Id;
                        tasksToUpdate.add( t );
                    }

                   Database.merge(mastercontact, mergedcontact, false);

                   // contactsToDelete.add( mergedcontact );
                }

            }
        }

       
        if( tasksToUpdate.size() > 0 ) update tasksToUpdate;
      //  if( contactsToDelete.size() > 0 ) delete contactsToDelete;

    }
    
    global void finish(Database.BatchableContext BC){
        
    }
        

}
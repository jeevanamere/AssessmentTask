trigger contrigger on Contact (after update, after insert, after delete) {
    if((Trigger.isAfter && Trigger.isUpdate) || (Trigger.isAfter && Trigger.isInsert)){
        ContactHandler.mtdName(Trigger.New);
    }
    if((Trigger.isAfter && Trigger.isDelete)){
		if((Trigger.isAfter && Trigger.isDelete)){
        ContactHandler.mtdName(Trigger.Old);
    }        
    }

}
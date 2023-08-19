trigger ContactTrigger on Contact (after insert,after delete) {
	//Contact Count after insertion
	if(Trigger.isAfter && (Trigger.isInsert)){
       		ContactController.countContacts(Trigger.New,null,true);
	}
	
	//Contact count after deletion
	if(Trigger.isAfter && Trigger.isDelete){
        	ContactController.countContacts(null,Trigger.Old,false);
 	}
}
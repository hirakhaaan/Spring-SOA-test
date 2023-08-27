trigger ContactTrigger on Contact (after insert,after delete,after update) {
	//Contact Count after insertion
	if(Trigger.isAfter && (Trigger.isInsert)){
       		ContactController.countContacts(Trigger.New,null,true,false);

	//Contact Count after Updation
	if(Trigger.isAfter && Trigger.isUpdate){
       		ContactController.countContacts(Trigger.New,Trigger.OldMap,false,true);
    	} 

	//Contact count after deletion
	if(Trigger.isAfter && Trigger.isDelete){
               ContactController.countContacts(null,Trigger.OldMap,false,false);
 	}

}

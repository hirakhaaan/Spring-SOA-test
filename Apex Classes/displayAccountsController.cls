public class displayAccountsController {
	 @AuraEnabled
      public static List<Account> accListData() {
          return [SELECT Id, Name, Number_Of_Contacts__c, Phone, Rating,Type,CreatedBy.Name,CreatedDate 
		  FROM Account 		  
		  ORDER BY createdDate DESC LIMIT 10];
      }
}

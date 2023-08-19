public class ContactController {
    public static void countContacts(List<Contact> conList,List<Contact> oldconList,Boolean isInsert){
        Set<id> AccSet=new Set<id>();
        List<Account> accsToUpdate=new List<Account>();
        
        //checking if contacts are getting inserted
        if(isInsert){
            for(Contact con:conList){
                if(con.AccountId!=null){
                    AccSet.add(con.AccountId);
                }
            }
        }else{//checking if contacts are getting deleted
            for(Contact con:oldconList){
                if(con.AccountId!=null){
                    AccSet.add(con.AccountId);
                }
            }  
        }
        //querying all the accounts and their related contacts
        List<Account> accList=[select id,(select Id from Contacts) 
			       from Account 
			       where Id IN :AccSet];
        
        if(accList.size()>0){
            for(Account acc:accList){
                acc.Number_Of_Contacts__c=acc.Contacts.size();
                accsToUpdate.add(acc);
            }
            update accsToUpdate;
        }
    }
}  
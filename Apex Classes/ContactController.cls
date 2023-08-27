public class ContactController {
    public static void countContacts(List<Contact> conList,Map<Id,Contact> oldconMap,Boolean isInsert,Boolean isUpdate){
        Set<id> AccSet=new Set<id>();
        List<Account> accsToUpdate=new List<Account>();
        
        //checking if contacts are getting inserted
        if(isInsert){
            for(Contact con:conList){
                if(con.AccountId!=null){
                    AccSet.add(con.AccountId);
                }
            }
        }else if(isUpdate){//checking if contacts are getting updated
            for(Contact con:conList){
                if(oldconMap.get(con.Id).AccountId != con.AccountId){
                    if(con.AccountId!=null){
                        AccSet.add(con.AccountId);
                    }
                    if(oldconMap.get(con.Id).AccountId != null){
                        AccSet.add(oldconMap.get(con.Id).AccountId);
                    }
                }
            }  
        }
        else{//checking if contacts are getting deleted
            for(Id conId:oldconMap.keyset()){
                if(oldconMap.get(conId).AccountId!=null){
                    AccSet.add(oldconMap.get(conId).AccountId);
                }
            }  
        }
        
        try{
            //querying all the accounts and their related contacts
            List<Account> accList=[select id,(select Id from Contacts) from Account where Id IN :AccSet];
            
            if(accList.size()>0){
                for(Account acc:accList){
                    acc.Number_Of_Contacts__c=acc.Contacts.size();
                    accsToUpdate.add(acc);
                }
                update accsToUpdate;
            }
        }catch(Exception e){
            System.debug('Exception Message'+e.getMessage()+'Line No>'+e.getLineNumber());
        }
    }  
}  

trigger Assign_UnitofInterest on Case (before insert, before update) {
    Case[] caselst=trigger.New;
    Case c=caselst[0];
    boolean flag = false;
  
    if( Trigger.IsInsert ) {
        flag = true;
    }
    
    if( Trigger.IsUpdate ) {
        if( c.Property_of_Interest__c != Trigger.oldMap.get(c.Id).Property_of_Interest__c ){
               flag = true;
           }
    }
    
    if( flag )
    { 
        List<Property__c> proplst=[Select Id, Multi_Family_Property__c from Property__c where Id=:c.Property_of_Interest__c AND Multi_Family_Property__c = false];
        if(proplst.size()>0)
        { 
            List<Unit__c> unitlst=[Select id from Unit__c where Property__c=:proplst[0].Id];
            if(unitlst.size()>0 && unitlst.size()<2) 
            {
                    c.Unit_of_Interest__c=unitlst[0].Id;            
            } 
        }
    }
}

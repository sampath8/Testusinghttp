trigger UpdateProperty_Price_Active_byUnit on Unit__c (after insert, after update)
{
    Unit__c u=trigger.New[0];
    Property__c p=[Select Id,Active__c,Price__c,Multi_Family_Property__c from Property__c where Id=:u.Property__c];
    if(p.Multi_Family_Property__c==false)
    {
        p.Active__c=(u.Active__c==true)?'Yes':'No';
        p.Price__c=u.Effective_Rent__c;
        update p;
    }
}
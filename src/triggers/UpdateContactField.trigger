trigger UpdateContactField on Case (after insert, after Update) 
{
    Case c = trigger.new[0];
    if(c.ContactId != null ){
        List<Contact> co=[SELECT Id,FirstName,LastName,MobilePhone,Email,Recordtype.Name FROM Contact where Id=:c.ContactId];
        for(Contact cc:co)
        {
            if(cc.Recordtype.Name =='Guest')
            {
                if(c.Correct_First_Name__c != null)
                {
                    cc.FirstName=c.Correct_First_Name__c;
                }
                if(c.Corrected_Last_Name__c != null)
                {
                    cc.LastName=c.Corrected_Last_Name__c;
                }
                if(c.Corrected_Alt_Phone__c != null)
                {
                    cc.MobilePhone=c.Corrected_Alt_Phone__c;
                }
                if(c.Corrected_Email__c != null)
                {
                    cc.Email=c.Corrected_Email__c;
                } 
            }
        }
        update co; 
    }
   
}
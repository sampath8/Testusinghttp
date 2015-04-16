trigger updatecase on Appointment__c (after insert)
{
    Appointment__c a= trigger.new[0];
    String unit_name;
    List<Unit__c> uu=[Select Id, Name from Unit__c where Id=:a.Unit__c];
    for(Unit__c u:uu)
    {
        unit_name=u.Name;
    }
    If(a.Invite_Status__c=='Invited')
    {
       List<Case> caselist = [select Id,Status,Appointment_1_Unit_ID__c,Appointment_2_Unit_ID__c,Appointment_3_Unit_ID__c,
       Appointment_1_ID__c,Appointment_2_ID__c,Appointment_3_ID__c From Case Where Id=:a.Case__C];  
       for(Case cc:caselist)  
       {              
            if(cc.Appointment_1_ID__c==null)
            {
                cc.Appointment_1_ID__c=a.Name;
            }
            else if(cc.Appointment_2_ID__c==null)
            {
                cc.Appointment_2_ID__c=a.Name;
            }
            else if(cc.Appointment_3_ID__c==null)
            {
                cc.Appointment_3_ID__c=a.Name;
            }
                       
            if(a.Unit__c !=null)
            {                
                if(cc.Appointment_1_Unit_ID__c==null)
                {
                    cc.Appointment_1_Unit_ID__c=unit_name;
                }
                else if(cc.Appointment_2_Unit_ID__c==null)
                {
                    cc.Appointment_2_Unit_ID__c=unit_name;
                }
                else if(cc.Appointment_3_Unit_ID__c==null)
                {
                    cc.Appointment_3_Unit_ID__c=unit_name;
                }                
            }
            else
            {
                if(cc.Appointment_1_Unit_ID__c==null)
                {
                    cc.Appointment_1_Unit_ID__c=a.Customer_Unit_ID__c;
                }
                else if(cc.Appointment_2_Unit_ID__c==null)
                {
                    cc.Appointment_2_Unit_ID__c=a.Customer_Unit_ID__c;
                }
                else if(cc.Appointment_3_Unit_ID__c==null)
                {
                    cc.Appointment_3_Unit_ID__c=a.Customer_Unit_ID__c;
                }
            }
            cc.Status='Showing Set';
            Update cc; 
        }    
    }
}
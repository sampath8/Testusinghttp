trigger Create_Emergency_Dispatch on Service_Request1__c (after insert, after update) {
Service_Request1__c s = trigger.new[0];
Integer i;
if(s.Status__c=='Initiate Emergency Dispatch' && s.Emergency_Dispatch_Status__c=='Not Accepted' && s.Final_Request_Disposition__c=='Emergency')
{
for(Emergency_Dispatch__c [] ss:[Select Id, Name,Service_Request__c from Emergency_Dispatch__c where Service_Request__c=:s.Id])
{
    i=ss.size();
}
    if(i==0)
    {
        Emergency_Dispatch__c e=new Emergency_Dispatch__c ();
        e.Service_Request__c=s.Id;
        e.Work_Order_Dispatch__c=s.Work_Order_Dispatch__c;
        e.Customer_ID__c=s.Customer_ID__c;
        e.Customer_Work_Order_ID__c=s.Customer_Work_Order_ID__c;
        e.Contact_Name__c=s.Contact_Name_Text__c;
        e.Contact_Phone__c=s.Contact_Phone__c;
        e.Contact_Mobile__c=s.Contact_Mobile__c;
        e.Contact_Email__c=s.Contact_Email__c;
        e.Account__c=s.Account__c;
        e.Property_of_Interest__c=s.Property_Interest__c;
        e.Room_Area_Impacted__c=s.Room_Area_Impacted__c;
        //----created on 09/06/2014----
        e.City__c=s.City__c;
        e.State__c=s.State__c;
        e.Zip__c=s.Zip_Code__c;
        //------------------    
        e.Unit_Needing_Service__c=(s.Unit_Name__c==null)?'':s.Unit_Name__c;
        e.Building_Name_Number__c=(s.Building_Name_Number__c==null)?'':s.Building_Name_Number__c;
        e.Level__c=s.Level__c;
        insert e;
    }
}
}
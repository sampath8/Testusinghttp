trigger updateappointment on Property__c (after update){
    Property__c a = trigger.new[0];
    If((a.Active__c == 'No'))
    {
        /*while( true == true ) {
            List<Appointment__c> lstUpdatedAppointments = new List<Appointment__c>();
            List<Appointment__c> appList = new List<Appointment__c>();
            appList =[Select Id,Invite_Status__c,CanceledRejected_By__c  From Appointment__c where Property_name__c=:a.name and Appointment_Date__c>=today AND (Invite_Status__C='Invited' OR Invite_Status__C='Accepted') LIMIT 3];
        	
            if ( 0 == appList.size() ) {
                break;
            }
            
            for( Appointment__c apt: appList ) {
                apt.Invite_Status__c='Canceled' ;
                apt.CanceledRejected_By__c='Automated System (home leased)';
                lstUpdatedAppointments.add(apt);
            }
            upsert lstUpdatedAppointments;
        }*/
        
        List<Appointment__c> lstUpdatedAppointments = new List<Appointment__c>();
        List<Appointment__c> appList =[Select Id,Invite_Status__c,CanceledRejected_By__c  From Appointment__c where Property_name__c=:a.name and Appointment_Date__c>=today AND (Invite_Status__C='Invited' OR Invite_Status__C='Accepted') ];
        {
            if (appList.size()>0)
            {
                for (Appointment__c aa:appList)
                {
                    aa.Invite_Status__c='Canceled' ;
                    aa.CanceledRejected_By__c='Automated System (home leased)';
                    
                    if( lstUpdatedAppointments.size() < 48 ) {
                        lstUpdatedAppointments.add(aa);
                    } else {
                        
                        lstUpdatedAppointments.add(aa);
                        update lstUpdatedAppointments;
                        break;
                        lstUpdatedAppointments.clear();
                    }
                }
            }
        }
    }
}
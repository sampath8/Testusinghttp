trigger UpdateRentRange on Unit__c (before insert, before update) {    
    
    Unit__c u = trigger.new[0]; 
   
    public static Unit__c unit { get; set; }    
    
    LIST<double> payTermValues = new LIST<double>{};
    double minimum_rent,maximum_rent;
    integer n = 0,i;
    
    if( u.X1_Month_Lease__c != null ) {
      payTermValues.add(u.X1_Month_Lease__c );
      n = n+1;
    }
    
    
    if( u.X2_Month_Lease__c != null ) {
       payTermValues.add( u.X2_Month_Lease__c );    
       n = n+1;
    }
    
    
    if( u.X3_Month_Lease__c != null ) {
       payTermValues.add( u.X3_Month_Lease__c );     
       n = n+1;
    }
    
    
    if( u.X4_Month_Lease__c != null ) {
       payTermValues.add( u.X4_Month_Lease__c );
       n = n+1;
    }
        
    if( u.X5_Month_Lease__c != null ) {
       payTermValues.add( u.X5_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X6_Month_Lease__c != null ) {
       payTermValues.add( u.X6_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X7_Month_Lease__c != null ) {
       payTermValues.add( u.X7_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X8_Month_Lease__c != null ) {
       payTermValues.add( u.X8_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X9_Month_Lease__c != null ) {
       payTermValues.add( u.X9_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X10_Month_Lease__c != null ) {
       payTermValues.add( u.X10_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X11_Month_Lease__c != null ) {
       payTermValues.add( u.X11_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X12_Month_Lease__c != null ) {
       payTermValues.add( u.X12_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X13_Month_Lease__c != null ) {
       payTermValues.add( u.X13_Month_Lease__c );
       n = n+1;
    }
    
    if( u.X14_Month_Lease__c != null ) {
       payTermValues.add( u.X14_Month_Lease__c );
       n = n+1;
    }
        
    if( u.X24_Month_Lease__c != null ) {
       payTermValues.add( u.X24_Month_Lease__c );
       n = n+1;
    }
    system.debug(payTermValues);
    if (n == 1)
    {
        minimum_rent = payTermValues[0];
        maximum_rent = payTermValues[0];            
    } 
    
    system.debug(payTermValues.size());
    
    
    if( payTermValues.size() > 1 ) {
        if (payTermValues[0] > payTermValues[1]){
          maximum_rent = payTermValues[0];
          minimum_rent = payTermValues[1];
        } else {
          maximum_rent = payTermValues[1];
          minimum_rent = payTermValues[0];
        } 
        
         for (i = 2; i<n; i++){        
            if (payTermValues[i] >  maximum_rent)     
                maximum_rent = payTermValues[i];
       
            else if (payTermValues[i] < minimum_rent)     
                 minimum_rent = payTermValues[i];
        }
    } else {
        if( payTermValues.size() == 1 ){
             minimum_rent = payTermValues[0];
             maximum_rent = payTermValues[0];
        }
        else 
        {
            minimum_rent = 0;
       		maximum_rent = 0;
        }
    }
    
    u.Minimum_Rent__c = minimum_rent.round();
    u.Maximum_Rent__c = maximum_rent.round();
              
    u.Rent_Range__c = '$'+minimum_rent.round() + '  -  $' + maximum_rent.round();   
}
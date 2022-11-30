trigger workingPatternTrigger on Working_Pattern__c (before insert, after insert, before update, after update, before delete, after delete) {
    switch on Trigger.operationType {
        
        when BEFORE_INSERT {
            //Invoke before insert trigger handler
            workingPatternHelper wpHandler = new workingPatternHelper();
            wpHandler.dobeforeActions(trigger.new,null,true);
        }
        when BEFORE_UPDATE {
            //Invoke before update trigger handler
            workingPatternHelper wpHandler = new workingPatternHelper();
            wpHandler.dobeforeActions(trigger.new,trigger.oldmap,false);
        }
        
        
    }
    
    
    
}
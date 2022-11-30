trigger AssociateContract on Contract__c (before insert , after update, before update) {

    
  if(Trigger.isbefore && Trigger.isInsert){
      AssociateContract.WorkingPattrenMethodInsert(Trigger.new);   
    }
    
    if(Trigger.isbefore && Trigger.isupdate){
        AssociateContract.WorkingPattrenMethodUpdate(Trigger.new, Trigger.oldmap);
    
    }
    
}
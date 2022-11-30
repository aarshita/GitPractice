trigger StudentHistoryTrackingTrigger on Student__c (after update) {

    StudentHistoryTracking.StudentHistoryTrackingMethod(Trigger.newmap, Trigger.oldmap);
    
}
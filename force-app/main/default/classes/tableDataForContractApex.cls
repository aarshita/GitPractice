public with sharing class tableDataForContractApex {
   
    @AuraEnabled(cacheable=true)
    public static List<Working_Pattern__c> tableDataRecords(String recordId){
        try {
            String ContractId = recordId;
           
            String ContractWPID = [Select Working_Pattern__c from Contract__c where id =:ContractId limit 1].Working_Pattern__c;
            system.debug(ContractWPID);

            List<Working_Pattern__c> WPList =  [Select Id, Name, Monday__c ,Tuesday__c,Wednesday__c, Thursday__c,Friday__c, Saturday__c,Sunday__c, Off_Day__c,Monday_Timing__c,Tuesday_Timing__c,Wednesday_Timing__c,Thursday_Timing__c,Friday_Timing__c,Saturday_Timing__c,Sunday_Timing__c From Working_Pattern__c where id=:ContractWPID];
            return WPList;
        } catch (Exception e) {
            throw new AuraHandledException('error '+e.getMessage());
        }
    }
}
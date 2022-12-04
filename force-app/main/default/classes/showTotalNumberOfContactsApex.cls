public with sharing class showTotalNumberOfContactsApex {
   
    @AuraEnabled
    public static Double showTotalContMethod(String RecId){
        try {
            
            Double ContactCount;

            List<AggregateResult> AggList = [Select count(id) RecordCount from Contact where Accountid =: RecId ];

            For(AggregateResult agg : AggList){
            ContactCount = Double.ValueOf(agg.get('RecordCount'));
            }

            return ContactCount;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}

public with sharing class finalSOQLApex {
   
    public class Wrapper{
        @AuraEnabled public String label;
        @AuraEnabled public string value;
     }

    @AuraEnabled
    public static List<Wrapper>  AllObjects(){
        try {
            List < Schema.SObjectType > gd = Schema.getGlobalDescribe().Values();
            //if(LabelApiList == null){
            //Wrapper WrapperVar = new Wrapper();
               List<Wrapper> LabelApiList = new List<Wrapper>();
                For(SObjectType Obj :gd){
            	Wrapper WrapperVar = new Wrapper();    
                 WrapperVar.label = Obj.getDescribe().getLabel();
                  WrapperVar.value = Obj.getDescribe().getName();
                    LabelApiList.add(WrapperVar);
                }
            
            return LabelApiList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Wrapper> getAllFieldss(String obj){
        try {
            Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
            List<Wrapper> LabelApiList = new List<Wrapper>();
            Schema.SObjectType sobjType = gd.get(obj);
           // Schema.DescribeFieldResult r = sobjType.getDescribe();
            Map<String, Schema.SObjectField> MapofField = sobjType.getDescribe().fields.getMap();
            for(String keys: MapofField.keySet()){
            Wrapper WrapperVar1 = new Wrapper();  
              WrapperVar1.label = MapofField.get(keys).getDescribe().getLabel();
              //system.debug(WrapperVar.label);
              WrapperVar1.value = MapofField.get(keys).getDescribe().getName(); 
              //system.debug(  WrapperVar.value);
              LabelApiList.add(WrapperVar1);
            }
               //system.debug(LabelApiList);
               
             return LabelApiList;   
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<sobject>queryRecord(string records){
        List<sobject> queryRecord = new List<sobject>();     
        queryRecord =  Database.query(records);
        system.debug('queryRecord' +queryRecord);
        if(queryRecord.size()> 0 ){
            return  queryRecord;
        }
        else{
            
            return null;
        }
        
    }
}
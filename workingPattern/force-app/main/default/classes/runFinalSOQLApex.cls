public class runFinalSOQLApex {

      public class Wrapper{
       @AuraEnabled public String label;
       @AuraEnabled public string value;
    }
    
    
  /*  @AuraEnabled
       public static List<String> AllOrgObjects() {
        List<String> objectList = new List<String>();
        List < Schema.SObjectType > gd = Schema.getGlobalDescribe().Values();      
        for(SObjectType Obj : gd){
            objectList.add(Obj.getDescribe().getLabel());
        }
           system.debug(objectList);
        return objectList;
           
       }*/
    
    	@AuraEnabled
        public static List<Wrapper> AllOrgObjects() {
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
        }
    
        
    /*   @AuraEnabled
    public static List<String> getAllFields( String obj){
        List<String> reqFields = new List<String>();
        Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType sobjType = gd.get(obj);
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        Map<String, Schema.SObjectField> MapofField = r.fields.getMap();
        for(String keys: MapofField.keySet()){

        reqFields.add(MapofField.get(Keys).getDescribe().getLabel());

        }
        return reqFields;
    }*/
    
    
    
    	@AuraEnabled
        public static List<Wrapper> getAllFieldss(String obj) {
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
         
    }
    @auraEnabled    
    public static List<sobject> DataQuery(string data){
        List<sobject> QuryList = new List<sobject>();     
        QuryList =  Database.query(data);
        if(QuryList.size()> 0 ){
            system.debug('Query List'+QuryList);
            return  QuryList;
        }
        else{
            
            return null;
        }
        
    }
        
        
}
public class AssociateContract {
    // Adding a comment here.
    public static void WorkingPattrenMethodInsert(List<Contract__c> contractList){
        
        
        Boolean isUpdate= false;
        String ContractType;
        String DeliveryArea;
        For(Contract__c con:ContractList){
            if(con.Contract_Type__c !=null && con.Delivery_Area__c!=null){
                ContractType = con.Contract_Type__c;
                DeliveryArea = con.Delivery_Area__c;
                isUpdate = true;   
            }
        }
        
        if(isUpdate){
            list<Working_Pattern__c> WorkingPlist = [Select id,Contract_Type__c,Delivery_Area__c from  Working_Pattern__c where Contract_Type__c =: ContractType AND Delivery_Area__c =:DeliveryArea limit 1];
            
            For(Contract__c cont:ContractList){
                if(WorkingPlist.size()>0){
                    string WorkingId = WorkingPlist[0].id;
                    cont.Working_Pattern__c = WorkingId;
                }else{
                    cont.Working_Pattern__c=null;
                } 
            } 
            
        } 
    }
    
    public static void WorkingPattrenMethodUpdate(List<Contract__c> ContractList , Map<Id,Contract__c> ContractOldMap){
        
        Boolean isUpdate= false;
        String ContractType;
        String DeliveryArea;
        For(Contract__c con:ContractList){
            if(ContractOldMap != null){
                if(con.Contract_Type__c != ContractOldMap.get(con.id).Contract_Type__c || con.Delivery_Area__c != ContractOldMap.get(con.id).Delivery_Area__c){
                    ContractType = con.Contract_Type__c;
                    DeliveryArea = con.Delivery_Area__c;
                    isUpdate = true;   
                }
            }
            
        }
        
        if(isUpdate){
            list<Working_Pattern__c> WorkingPlist = [Select id,Contract_Type__c,Delivery_Area__c from  Working_Pattern__c where Contract_Type__c =: ContractType AND Delivery_Area__c =:DeliveryArea limit 1];
            
            For(Contract__c cont:ContractList){
                if(WorkingPlist.size()>0){
                    string WorkingId = WorkingPlist[0].id;
                    cont.Working_Pattern__c = WorkingId;
                }else{
                    cont.Working_Pattern__c=null;
                } 
            } 
            
        }
        
        
        
    }
}
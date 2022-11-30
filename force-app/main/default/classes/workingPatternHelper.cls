public with sharing class workingPatternHelper {
    
    public static final string monDay = utils.monDay;
    public static final string tuedayDay = utils.tuedayDay;
    public static final string wenDay = utils.wenDay;
    public static final string thuDay = utils.thuDay;
    public static final string friDay = utils.friDay;
    public static final string satDay = utils.satDay;
    public static final string sunDay = utils.sunDay;
    public static final string wPObjName = utils.wPObjName;
    
    Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    Schema.SObjectType WpSchema = schemaMap.get(wPObjName);
    Map<String, Schema.SObjectField> fieldMap = WpSchema.getDescribe().fields.getMap();
    
    public string mName= fieldMap.get(monDay).getDescribe().getLabel();
    public string tuName= fieldMap.get(tuedayDay).getDescribe().getLabel();
    public string weName= fieldMap.get(wenDay).getDescribe().getLabel();
    public string thName= fieldMap.get(thuDay).getDescribe().getLabel();
    public string frName= fieldMap.get(friDay).getDescribe().getLabel();
    public string stName= fieldMap.get(satDay).getDescribe().getLabel();
    public string suName= fieldMap.get(sunDay).getDescribe().getLabel();
    
    
    
    
    
    public void dobeforeActions(list<Working_Pattern__c> newRecordList, map<id,Working_Pattern__c>oldMapWorkingP, boolean checkBefore){
        
        
        for(Working_Pattern__c wp:newRecordList){
            
            if(wp.Delivery_Area__c !=null & wp.Contract_Type__c!=null){
                
                wp.Name = wp.Delivery_Area__c+'-'+wp.Contract_Type__c;
            }
            
            if(wp.Monday__c==null){
                wp.Monday_Timing__c = null;
                
            }else if(wp.Monday__c!=null && checkBefore){
                
                wp.Monday_Timing__c =  checkMetaDatavalues(mName,wp.Monday__c);
                
            }else if(wp.Monday__c!=null && wp.Monday__c!=oldMapWorkingP.get(wp.id).Monday__c){
                
                wp.Monday_Timing__c =  checkMetaDatavalues(mName,wp.Monday__c);
                
            }
            if(wp.Tuesday__c==null){
                wp.Tuesday_Timing__c = null;
                
            }else if(wp.Tuesday__c!=null && checkBefore){
                
                wp.Tuesday_Timing__c =  checkMetaDatavalues(tuName,wp.Tuesday__c);
                
            }
            else if(wp.Tuesday__c!=null && wp.Tuesday__c!=oldMapWorkingP.get(wp.id).Tuesday__c){
                wp.Tuesday_Timing__c =  checkMetaDatavalues(tuName,wp.Tuesday__c);
                
            }
            if(wp.Wednesday__c==null){
                wp.Wednesday_Timing__c = null;
                
            }
            else if(wp.Wednesday__c!=null && checkBefore){
                
                wp.Wednesday_Timing__c =  checkMetaDatavalues(weName,wp.Wednesday__c);
                
            } else if(wp.Wednesday__c!=null && wp.Wednesday__c!=oldMapWorkingP.get(wp.id).Wednesday__c){
                wp.Wednesday_Timing__c =  checkMetaDatavalues(weName,wp.Wednesday__c);
                
            }
            if(wp.Thursday__c==null){
                wp.Thursday_Timing__c = null;
                
            }
            else if(wp.Thursday__c!=null && checkBefore){
                
                
                wp.Thursday_Timing__c =  checkMetaDatavalues(thName,wp.Thursday__c);
                
            } else if(wp.Thursday__c!=null && wp.Thursday__c!=oldMapWorkingP.get(wp.id).Thursday__c){
                wp.Thursday_Timing__c =  checkMetaDatavalues(thName,wp.Thursday__c);
                
            }
            if(wp.Friday__c==null){
                wp.Friday_Timing__c = null;
                
            }
            else if(wp.Friday__c!=null && checkBefore){
                
                wp.Friday_Timing__c =  checkMetaDatavalues(frName,wp.Friday__c);
                
            } else if(wp.Friday__c!=null && wp.Friday__c!=oldMapWorkingP.get(wp.id).Friday__c){
                wp.Friday_Timing__c =  checkMetaDatavalues(frName,wp.Friday__c);
                
            }
            if(wp.Saturday__c==null){
                wp.Saturday_Timing__c = null;
                
            }
            else if(wp.Saturday__c!=null && checkBefore){
                
                wp.Saturday_Timing__c =  checkMetaDatavalues(stName,wp.Saturday__c);
                
            } else if(wp.Saturday__c!=null && wp.Saturday__c!=oldMapWorkingP.get(wp.id).Saturday__c){
                wp.Saturday_Timing__c =  checkMetaDatavalues(stName,wp.Saturday__c);
                
            }
            if(wp.Sunday__c==null){
                wp.Sunday_Timing__c = null;
                
            }
            else if(wp.Sunday__c!=null && checkBefore){
                
                wp.Sunday_Timing__c =  checkMetaDatavalues(suName,wp.Sunday__c);
                
            } else if(wp.Sunday__c!=null && wp.Sunday__c!=oldMapWorkingP.get(wp.id).Sunday__c){
                wp.Sunday_Timing__c =  checkMetaDatavalues(suName,wp.Sunday__c);
                
            }
            
            
            
            
        }
        
        
        
        
    }
    
    
    public string checkMetaDatavalues(string day, string shift){
        string setTiming;
        string dayTime = day+'_'+shift;
        system.debug('dayTime'+dayTime);
        map<string,string> shiftMap = new map<string,string>();
        Map<String, Shift_Timing__mdt> mapShiftTiming = Shift_Timing__mdt.getAll();
        system.debug('setTiming'+mapShiftTiming.get(dayTime).Timing__c);
        setTiming = mapShiftTiming.get(dayTime).Timing__c;
        system.debug('setTiming'+setTiming);
        return setTiming;
    }
}
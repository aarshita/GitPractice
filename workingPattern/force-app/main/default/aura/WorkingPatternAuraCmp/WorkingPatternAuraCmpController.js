({
 myAction : function(component, event, helper) 
    {
        var WPList = component.get("c.tableDataRecords");
        WPList.setParams
        ({
            recordId: component.get("v.recordId")
        });
        
        WPList.setCallback(this, function(data) 
                           {
                              
                               component.set("v.WPList", data.getReturnValue());
                               console.log('Value',data.getReturnValue());
                           });
        $A.enqueueAction(WPList);
 }
})
({
	doInt : function(component, event, helper) {
		
       var opt =[];
        const action= component.get("c.AllOrgObjects");
        action.setCallback(this,function(response){
            const state =response.getState();
       
            if(state ==="SUCCESS"){
                var allvalues=response.getReturnValue();
                console.log(allvalues);
                    /*allvalues.forEach((value)=>{
                        var Item ={
                            "label": value,
                            "value": value
                        }
                        opt.push(Item);
                    })*/
                    component.set("v.ObjectList",allvalues);
               // [{Label:Account,value:Account},{Label:Contact,value:contact}]
            }
            
        });
        $A.enqueueAction(action);
        
        
	},
    
    handleFieldChange : function(component, event, helper) {
        
        const fields =[];
        var selectedOptionValue = event.getParam("value");
        component.set("v.ObjName",selectedOptionValue);
        var action =  component.get("c.getAllFieldss");
        action.setParams({
            obj:selectedOptionValue

        });
        
        action.setCallback(this,function(response){
            const state = response.getState();
             if(state ==="SUCCESS"){
                var allvalues=response.getReturnValue();
                   /*allvalues.forEach((value)=>{
                        var Item ={
                            "label": value,
                            "value": value
                        }
                        fields.push(Item);
                    })*/
                    component.set("v.fields",allvalues);
                 	console.log('fields '+allvalues);
                   var listfield = component.get("v.fields");
                   component.set("v.values",listfield);
           
    }
})
         $A.enqueueAction(action);
    },
    
    handleSelectChange: function(component, event, helper){
    var selectedFieldValue = event.getParam("value");
    var ListVal = component.set("v.selectedList", selectedFieldValue.toString() + "");
   // var getvalue = component.get("v.selectedList");
	},
    
    genrateFieldQuery : function(component, event, helper){ 
        
       var objtName = component.get("v.ObjName");  
     // var SelectId = component.get("v.options");   
      var makequery = component.get("v.selectedList");
      var querymaker = 'SELECT'+' ' + makequery +' '+'From'+ ' ' + objtName;  
      component.set("v.FieldQuery",querymaker);     
    },
    
    fetchRecord  :  function(component, event, helper){ 
        component.set("v.showData",true);
    	var datalist = component.get("v.FieldQuery");
        var action = component.get('c.DataQuery');
        action.setParams({
            data : datalist
        });
        action.setCallback(this, function(response){
            var state = response.getState();      
            if (state === "SUCCESS") { 
                var result = response.getReturnValue();
                if(result != null){
                    component.set("v.ListOfData",result);   
                }else{
                    
                    alert('No record to fetch');
                }   
                
            }
            else{
                alert('ERROR');
            }
        });
        $A.enqueueAction(action); 
    }
    
    
})
({
	doInit: function(component, event, helper) {   
    // Fetch the Account list from the Apex controller 
      var action = component.get('c.accListData');          
        action.setCallback(this, function(response){
            var state = response.getState();      
            //alert('state ' + state);
            if(state == "SUCCESS"){
                var result = response.getReturnValue();
                //alert('result ' + JSON.stringify(result));                
                component.set('v.account',result);
            }
        });
        $A.enqueueAction(action);
   },
 
})
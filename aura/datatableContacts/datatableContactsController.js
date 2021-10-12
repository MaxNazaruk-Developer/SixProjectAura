({
    fetchContact : function(component, event, helper) {
        helper.fetchContactHelper(component, event, helper);
    },

    searchContact : function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");        
        var action = component.get("c.findByName");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(responseSearch) {
            component.set("v.contactList", responseSearch.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})

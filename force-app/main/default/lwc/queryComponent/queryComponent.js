({
    fetchData: function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.contacts", response.getReturnValue());
            }
            else {
                console.log("Error fetching contacts");
            }
        });
        $A.enqueueAction(action);
    }
})

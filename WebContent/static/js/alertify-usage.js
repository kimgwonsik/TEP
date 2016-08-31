// include
/*<script src="PATH_TO_FILE/alertify.min.js"></script>
<link rel="stylesheet" href="PATH_TO_FILE/alertify.css" />
<link rel="stylesheet" href="PATH_TO_FILE/alertify.default.css" />*/

//------------------Default dialogs
alertify.alert("Message");

// confirm dialog
alertify.confirm("Message", function (e) {
    if (e) {
        // user clicked "ok"
    } else {
        // user clicked "cancel"
    }
});

// prompt dialog
alertify.prompt("Message", function (e, str) {
    // str is the input text
    if (e) {
        // user clicked "ok"
    } else {
        // user clicked "cancel"
    }
}, "Default Value");

//------------------Default notifications
alertify.log("Notification", type, wait);
alertify.success("Success notification");
alertify.error("Error notification");

//------------------customizable properties
//using the `set` method
//alertify.set( ... );

//Delay
alertify.set({ delay: 10000 });
alertify.log("Notification");
alertify.log("Notification", "", 0);

//Button labels
alertify.set({ labels: {
    ok     : "Accept",
    cancel : "Deny"
} });
// button labels will be "Accept" and "Deny"
alertify.confirm("Message");

//Button focus
alertify.set({ buttonFocus: "cancel" }); // "none", "ok", "cancel"
alertify.confirm("Message");

//Button order
alertify.set({ buttonReverse: true }); // true, false
alertify.confirm("Message");

//custom notification
alertify.custom = alertify.extend("custom");
alertify.custom("Notification");


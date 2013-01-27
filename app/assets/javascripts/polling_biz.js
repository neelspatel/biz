// once the document has been loaded, if we are a turf home page call the updatePosts and updateChats with a timer
var active = 0;

// might not be nec
var Counts = {};

function isEmpty(ob){
   for(var i in ob){ return false;}
  return true;
}

$(function() {
  if ($("#chats_container").length > 0) {
    setTimeout(updateChats, 1000);
  }
});
 

// updateChats sends an AJAX request to the server and evaluates a script on the Chat index, calls itself with timer
function updateChats() {

        var merchant_id = $("#merchant_id").attr("data-merchant");

        if ($(".chat").length > 0) 
        {
            var after = $(".chat:last-child").attr("data-time");
        } 
        else 
        {
            var after = "0";
        }

        // declare data object        
        var data_get = {};
        data_get["merchant_id"] = merchant_id;
        data_get["active"] = active;
        data_get["counts"] = updateCounts();

        // send the AJAX request
        $.get( "/chats.js", data_get);

        //$.getScript("/chats.js?merchant_id=" + merchant_id + "&after=" + after + "&active=" + active);
        setTimeout(updateChats, 4000);
}

// update the active chat loaded into the interface
$(function () {
    $(".conversation").click(function(e) {
        var target = $(e.target);
        active = $(target).parent().parent().attr("data-id");
        $(target).html("Conversation from User " + active);
        console.log(active);
    });
});

// callback for the AJAX polling request. Use to update the Counts global
function updateCounts () {
    var conversations = $(".conversation");    
    var counts = {};
    $(".conversation").each(function (i, obj) {
        counts[$(this).attr("data-id")] = $(this).attr("data-count");
    });
    return counts;   
}
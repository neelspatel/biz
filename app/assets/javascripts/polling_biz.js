// once the document has been loaded, if we are a turf home page call the updatePosts and updateChats with a timer
var active = 0;

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
        
        $.getScript("/chats.js?merchant_id=" + merchant_id + "&after=" + after + "&active=" + active);
        
        setTimeout(updateChats, 1000);
}

// update the active chat loaded into the interface
$(function () {
    $(".conversation").click(function(e) {
        active = $(e.target).parent().attr("data-id");
    });
});
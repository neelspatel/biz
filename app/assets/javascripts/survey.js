function getData () {
	var forms = [];
	$(".new_answer").each(function(i, obj){
		var question_type = $(this).find("#question_type_value").val();
		var user_id = $(this).find("#user_id_value").val();
		var widget_id = $(this).find("#widget_id_value_value").val();
		var item_id = $(this).find("#item_id_value_value").val();	  		
		console.log(question_type);
		
		if (question_type == "slider") {
			console.log("in slider");
			var val = $(this).find("input#slider")[0].value;		  			
		}
		else {
			var val = $(this).find("input:radio:checked").val();	  				
		}
		
		if (typeof val === 'undefined' ) {
			console.log("val is undefined");
		}
		else {
			console.log("For question type " + question_type + " for user id " + user_id + ", widget id " + widget_id + ", item id " + item_id + ": " + val);
			var obj = {"question_type": question_type, "user_id": user_id, "widget_id": widget_id, "item_id": item_id, "val": val};
			console.log(obj);
			forms.push(obj);
		}

		var data = JSON.stringify(forms);
		console.log(data);
	});
}


$("#mobile_page").on("pageinit", function(event) {
	$('#submit_all').click(function() {
		getData();
	});
})


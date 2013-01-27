

$(function () {
	if ($(".survey-item").length > 0) {
		alert("Called");
		$('#submit_all').click(function() {
	  		//creates a list of form data to submit
	  		var forms = [];
	  		alert("madeform");
	  		$(".new_answer").each(function(i, obj){
	  			var question_type = $(this).find("#question_type_value").val();
	  			var user_id = $(this).find("#user_id_value").val();
	  			var widget_id = $(this).find("#widget_id_value_value").val();
	  			var item_id = $(this).find("#item_id_value_value").val();	  		
	  			
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

	  			console.log(JSON.stringify(forms));
	  			alert("at end");


	  		});
		});
	}

	});


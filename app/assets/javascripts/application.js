//= require jquery_ujs
//= require_tree .

// this is a new func
		$(document).ready(function(){
				
				$("#addInputButton").click(function(){
								var inputs = $(".inputClass");
								var length = inputs.length;
								var clone = inputs.first().clone();
								clone.val("");
								clone.attr("name", "name["+(length)+"]");
								var div = $("#inputsCollection");
								div.append(clone);
				});
 
		});
$(document).ready(function(){

	$("#supporters-container").on("click", ".supporter-delete", function(event){
		event.preventDefault();
		var type = $(this).data('action');
		var url = $(this).attr('href');
		var supporter = $(this).closest('.supporter-item');
		$.ajax({
			url: url,
			type: type,
			success: function(response){
				console.log(response);
				$(supporter).remove();

			},
			error: function(response) {
				console.log("Error during supporter delete");
				console.log(response);
			}
		});
	});

});
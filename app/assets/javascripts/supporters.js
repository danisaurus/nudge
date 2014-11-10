$(document).ready(function(){

	$("#supporters-container").on("click", ".supporter-delete", function(event){
		event.preventDefault();
		var supporter = $(this).closest('.supporter-item');
		console.log(supporter);
		var supporterName = $(supporter).find(".supporter-name").text();
		if (confirm("Are you sure you want to remove " + supporterName + " from your circle?")){
			var type = $(this).data('action');
			var url = $(this).attr('href');
			$.ajax({
				url: url,
				type: type,
				success: function(response){
					console.log(response);
					$('#notice').text(response.notice);
					supporter.remove();

				},
				error: function(response) {
					console.log("Error during supporter delete");
					console.log(response);
				}
			});
		}
	});

});

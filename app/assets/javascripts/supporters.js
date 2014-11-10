$(document).ready(function(){

	$('#supportersShow').on('submit', '.edit_supporter', function(){
		event.preventDefault();
		var url = $(event.target).attr( 'action' ),
				data = $(event.target).serialize();
	});

});

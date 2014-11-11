$(document).ready(function(){

    $('#supportersShow').on('click','.editSupporter', function(event){
      event.preventDefault();
      var url = $(this).attr('href'),
          par = $(this).parent();
      $.get(url, function(serverResponse, status, jqXHR) {
        par.html(serverResponse)
      });
    })

  	$('#supportersShow').on('submit', '.edit_supporter', function(){
  		event.preventDefault();
  		var url = $(event.target).attr( 'action' ),
          par = $(event.target).parent()
  				data = $(event.target).serialize();
    $.post(url, data, function(serverResponse, status, jqXHR) {
      par.html(serverResponse)
  	});
  });
});

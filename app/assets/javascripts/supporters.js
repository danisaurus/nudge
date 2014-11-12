$(document).ready(function(){

    $('body').on('click','.editSupporter', function(event){
      event.preventDefault();
      var url = $(this).attr('href'),
          par = $(this).parent();
      $.get(url, function(serverResponse, status, jqXHR) {
        par.html(serverResponse)
      });
    })

  	$('body').on('submit', '.edit_supporter', function(){
  		event.preventDefault();
  		var url = $(event.target).attr( 'action' ),
          par = $(event.target),
  				data = $(event.target).serialize();
    $.post(url, data, function(serverResponse, status, jqXHR) {
      par.html(serverResponse)
  	});
  });

    $('body').on('click','.deleteSupporter', function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      $(this).parent().fadeOut();
      $.get(url, function(serverResponse, status, jqXHR) {});
    })


  $('body').on('submit', '#new_supporter', function(event){
    event.preventDefault();
    var url = $(this).attr( 'action' ),
        data = $("#new_supporter").serialize();

    $.post(url, data, function(serverResponse, status, jqXHR) {
      $(serverResponse).hide().appendTo('#network').fadeIn();
      $('form').find("input[type=text]").val("");
      $('.disappear').delay( 2000 ).fadeOut();
    });
  })
});

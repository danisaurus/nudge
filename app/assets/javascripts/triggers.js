$(document).ready(function(){
  var days = $("#trigger_duration_in_hours")
  days.val(1);

  $("body").on( "click", "#toggle-up", function() {
    days.val(Number(days.val()) + 1);
  });

  $("body").on( "click", "#toggle-down", function() {
    if (days.val() > 1){
      days.val(days.val() - 1);
    }
  });

  $('#new_trigger').on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr( 'action' ),
        data = $("#new_trigger").serialize(),
        par = $('body');

    $.post(url, data, function(serverResponse, status, jqXHR) {
      $(serverResponse).hide().appendTo('.my_triggers').fadeIn();
      $('form').find("textarea").val("");
    });
  });
});

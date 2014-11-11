$(document).ready(function(){
  var days = $("#trigger_duration_in_hours");
  days.val(1);
  days.hide();
  $("body").on( "click", "#toggle-up", function() {
    days.val(Number(days.val()) + 1);
      $('#incDays').text(days.val());
    if (days.val() > 1) {
      $('#day').text('days')
    }

  });

  $("body").on( "click", "#toggle-down", function() {
    if (days.val() > 1){
      days.val(days.val() - 1);
      $('#incDays').text(days.val());
      $('#day').text('day')
    }
    if (days.val() > 1) {
      $('#day').text('days')
    }

  });

  $('#new_trigger').on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr( 'action' ),
        data = $("#new_trigger").serialize(),
        par = $('body');

    $.post(url, data, function(serverResponse, status, jqXHR) {
      $(serverResponse).hide().appendTo('#notifications').fadeIn();
      $('form').find("textarea").val("");
    });
  });
});

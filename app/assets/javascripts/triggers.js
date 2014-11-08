$(document).ready(function(){
  var days = $("input")

  $("body").on( "click", ".toggle-up", function() {
    days.val(Number(days.val()) + 1);
  });

  $("body").on( "click", ".toggle-down", function() {
    if (days.val() > 1){
      days.val(days.val() - 1);
    }
  });




});

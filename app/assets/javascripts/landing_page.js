$(document).ready(function(){
  $('#login').hide();
  $('#signUp').on('click', function(event){
    event.preventDefault();
    $('#login').hide();
    $('#newUser').show();
  });

  $("#signIn").on('click', function(event){
    event.preventDefault();
    $('#login').show();
    $('#newUser').hide();
  });
});

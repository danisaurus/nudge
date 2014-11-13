$(document).ready(function(){

  $('button#signUp').on('click', function(event){
    event.preventDefault();
    $('.intro-logo, #homepage-cta').hide();
    $('#newUser, .signIn').show();
  });

  $("#signIn").on('click', function(event){
    event.preventDefault();
    $('.intro-logo, #homepage-cta').hide();
    $('#login, .signUpLink').show();
  });

});

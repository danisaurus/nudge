$(document).ready(function(){
  var navLink = $('.navLink')
  var activity = $('#userActivity')
  var settings = $('#userSettings')
  var account = $('#userAccount')
  account.hide();
  activity.hide();
  settings.hide();
  $('#monitorShow').hide();
  // $('#supportersShow').hide();
  $('#notificationsShow').hide();
  navLink.on('click', function(event){
    event.preventDefault();
  });

  $('#account').on('click', function(){
    $('#userContainer').children().hide();
    account.show();

  });

  $('#settings').on('click', function(){
    $('#userContainer').children().hide();
    settings.show();

  });

  $('#activity').on('click', function(){
    $('#userContainer').children().hide();
    activity.show();

  });


  $('#monitorSettings').on('click', function() {
    $('#page-content-wrapper').children().hide();
    $('#monitorsShow').show();
  })
  $('#supportSettings').on('click', function() {
    $('#page-content-wrapper').children().hide();
    $('#supportersShow').show();
  })
  $('#notificationsSettings').on('click', function() {
    $('#page-content-wrapper').children().hide();
    $('#notificationsShow').show();
  })
});

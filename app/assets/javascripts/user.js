$(document).ready(function(){
  var navLink = $('.navLink')
  var activity = $('#userActivity')
  var settings = $('#userSettings')
  var account = $('#userAccount')
  $('#newTriggerSettings').hide();
  account.hide();
  activity.hide();
  settings.hide();
  $('#monitorsShow').hide();
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

  $('#userAccount').on('click', function() {
    $('#page-content-wrapper').children().hide();
    $('#monitorsShow').show();
  })

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

  $('#showNewTrigger').on('click', function(){
    $( "#newTriggerSettings" ).slideToggle( "fast" );
  })

  var changeDivColor = function(div, color, margin){
    div.children().first().children().animate({
          backgroundColor: color,
          'margin-left': margin
        }, 400 );
  }

  $('#toggleTwitterTriggers').on('click', function(event){
    event.preventDefault();
    var that = $(this)
    var url = $(this).attr( 'href' );
    var text = $(this).next();
    if ( text.text() === 'Active') {
      text.text('Inactive')
      changeDivColor(that, '#FF0000', 19)
    } else {
     text.text('Active')
      changeDivColor(that, 'green', 1)
    }
    $.get(url, function(serverResponse, status, jqXHR){});
  });

  $('#toggleGoogleTriggers').on('click', function(event){
    event.preventDefault();
    var that = $(this)
    var url = $(this).attr( 'href' );
    var text = $(this).next();
    if ( text.text() === 'Active') {
      text.text('Inactive')
      changeDivColor(that, '#FF0000', 19)
    } else {
     text.text('Active')
     changeDivColor(that, 'green', 1)
    }
    $.get(url, function(serverResponse, status, jqXHR){});
  });


});

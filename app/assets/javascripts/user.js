$(document).ready(function(){
  var navLink = $('.navLink')
  var activity = $('#userActivity')
  var home = $('#userHome')
  var settings = $('#userSettings')
  var account = $('#userAccount')
  var newTriggerContainer = $('#newTriggerContainer')
  $('#newTriggerSettings').hide();
  account.hide();
  activity.hide();
  settings.hide();
  newTriggerContainer.hide();
  $('#monitorsShow').hide();
  // $('#supportersShow').hide();
  $('#notificationsShow').hide();
  navLink.on('click', function(event){
    event.preventDefault();
  });

  $('#account').on('click', function(){
    $('#userContainer').children().hide();
    newTriggerContainer.hide();
    account.show();

  });

  $('#settings').on('click', function(){
    $('#userContainer').children().hide();
    newTriggerContainer.hide();
    settings.show();

  });

  $('#activity').on('click', function(){
    $('#userContainer').children().hide();
    newTriggerContainer.hide();
    activity.show();

  });

  $('#home').on('click', function(){
    $('#userContainer').children().hide();
    newTriggerContainer.hide();
    home.show();

  });

  $('#userAccount').on('click', function() {
    $('#page-content-wrapper').children().hide();
    newTriggerContainer.hide();
    $('#monitorsShow').show();
  })

  $('#monitorSettings').on('click', function() {
    $('#page-content-wrapper').children().hide();
    newTriggerContainer.hide();
    $('#monitorsShow').show();
  })
  $('#supportSettings').on('click', function() {
    $('#page-content-wrapper').children().hide();
    newTriggerContainer.hide();
    $('#supportersShow').show();
  })
  $('#notificationsSettings').on('click', function() {
    $('#page-content-wrapper').children().hide();
    newTriggerContainer.show();
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

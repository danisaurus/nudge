$(document).ready(function(){
  var days = $("#trigger_duration_in_hours");
  days.val(1);
  days.hide();
  $('#triggerSentimentNotification').hide();
  $('.messageHolder').hide();
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
      if ( serverResponse.match(/class='disappear'/) ) {
        $(serverResponse).hide().appendTo('.trigger').fadeIn();
        $('.disappear').delay( 2000 ).fadeOut();
      } else {
      $(serverResponse).hide().appendTo('.tbody').fadeIn();
      $('form').find("textarea").val("");
      }
    });
  });

  $('body').on('click', '.toggle-up', function(){
    event.preventDefault();
    var url = $(event.target).parent().attr('href');
    var par = $(event.target).parent().parent().next();
    var dayVal = par.children().first();
    var oldVal = parseInt(dayVal.text());
    var newVal = oldVal + 1;
        dayVal.text(newVal)
    $.get(url, function(serverResponse, status, jqXHR){
    });
  });
  $('body').on('click', '.toggle-down', function(){
    event.preventDefault();
    var url = $(event.target).parent().attr('href');
    var par = $(event.target).parent().parent().prev();
    var dayVal = par.children().first();
    var oldVal = parseInt(dayVal.text());
    if (oldVal > 1 ){
        var newVal = oldVal - 1;
            dayVal.text(newVal)
          }
    $.get(url, function(serverResponse, status, jqXHR){
    })
  })

  $('.editTrigger').on('click', function(){
    event.preventDefault();
    var par = $(this).parent();
    var messageHolder = par.next().children();
    messageHolder.slideToggle();
    });


    var changeDivColorTheSequel = function(div, color, margin){
        div.animate({
              backgroundColor: color,
              'margin-left': margin
            }, 400 );
      }

    $('.trigDelete').on('click', function(event){
      event.preventDefault();
      var url = $(this).attr('href');
      var par = $(this).parent().parent();
      par.fadeOut('slow');
      $.get(url, function(serverResponse, status, jqXHR){})
    });

  $('.toggleTwitterTriggers').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    var childTarget = $(this).children().first().children().first()
    if ( childTarget.css("margin-left") === '1px' ) {
      changeDivColorTheSequel(childTarget, '#FF0000', 19)
    } else {
     changeDivColorTheSequel(childTarget, 'green', 1)
    }
    $.get(url, function(serverResponse, status, jqXHR){
    });
  });

   $('#triggerMenu').change(function() {
    if ( $(this).val() === "check_email_sentiment" ) {
      $('#triggerSentimentNotification').show();
    } else if ( $(this).val() === "check_twitter_sentiment" ) {
      $('#triggerSentimentNotification').show();
    } else {
      $('#triggerSentimentNotification').hide();
    }

   });

   $('.marginForChildren').on("submit", )

});










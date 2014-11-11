$(document).ready(function(){
  $('#divTwo').hide();
  $('#divThree').hide();
  var steps = [$('#stepOne'), $('#stepTwo'), $('#stepThree')]
  var formsOne = [$('#divOne'), $('#divTwo'), $('#divThree')];

  $('#nextButton').on('click', function(event){
    var id = $(this).parent().attr("id")
    if ($(formsOne[0]).is(":visible")) {
      $('#formHolder').children().hide();
      formsOne[1].fadeIn()
      steps[0].removeClass('active')
      steps[1].addClass('active')
    } else if ( $(formsOne[1]).is(":visible")) {
      $('#formHolder').children().hide();
      formsOne[2].fadeIn()
      $('#nextButton').html("<a href='/users/"+id+"'><h3>Done</h3></a>")
      steps[1].removeClass('active')
      steps[2].addClass('active')
    }

  });

  $('#backButton').on('click', function(event){
    if ($(formsOne[1]).is(":visible")) {
      $('#formHolder').children().hide();
      $('#nextButton').html("<h3>Next Step <i class='fa fa-chevron-right'></i></h3>")
      steps[1].removeClass('active')
      steps[0].addClass('active')
      formsOne[0].fadeIn()
    } else if ( $(formsOne[2]).is(":visible")) {
      $('#formHolder').children().hide();
      formsOne[1].fadeIn()
      $('#nextButton').html("<h3>Next Step <i class='fa fa-chevron-right'></i></h3>")
      steps[2].removeClass('active')
      steps[1].addClass('active')
    }
  });

  $('#new_supporter').on('submit', function(event){
    event.preventDefault();
    var url = $(this).attr( 'action' ),
        data = $("#new_supporter").serialize();

    $.post(url, data, function(serverResponse, status, jqXHR) {
      $(serverResponse).hide().appendTo('#network').fadeIn();
      $('form').find("input[type=text]").val("");
    });
  })

});

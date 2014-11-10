$(document).ready(function(){
  $('#divTwo').hide();
  $('#divThree').hide();
  var steps = [$('#stepOne'), $('#stepTwo'), $('#stepThree')]
  var formsOne = [$('#divOne'), $('#divTwo'), $('#divThree')];
  var next = 1;
  var makeNext = function(next){
    if (next < 2){
      return next+=1
    } else { return next = 2 }
  };
  var makePrevious = function(previous){
    if (previous > 0) {
      return previous -= 1
    } else { return previous = 0 }
  };

  $('#nextButton').on('click', function(event){
    var id = $(this).parent().attr("id")
    $('#formHolder').children().hide();
    if (next === 0) {
      steps[next].removeClass('active')
      next = 1;
    } else { steps[next - 1].removeClass('active') }
    if (next == 2) {
      $('#nextButton').html("<a href='/users/"+id+"'><h3>Done</h3></a>")
    } else {$('#nextButton').html("<h3>Next Step <i class='fa fa-chevron-right'></i></h3>")}
    formsOne[next].fadeIn()
    steps[next].addClass('active')
    next = makeNext(next);
  });

  $('#backButton').on('click', function(event){
    if (next !== 0 ){
      $('#formHolder').children().hide();
      $('#nextButton').html("<h3>Next Step <i class='fa fa-chevron-right'></i></h3>")
      if (next === 1) {
        next = 0
      } else if (next === 2 ) {
        next = makePrevious(next)
      };
      steps[next + 1].removeClass('active')
      formsOne[next].fadeIn()
      steps[next].addClass('active')
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

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

  var changeDivColor = function(div, color, margin){
    div.children().first().children().animate({
          backgroundColor: color,
          'margin-left': margin
        }, 400 );
  }

  // $('#twitterAuth').on('click', function(event){
  //   changeDivColor($(this), '#FF0000', 19)
  // });

  // $('#googleAuth').on('click', function(event){
  //   changeDivColor($(this), '#FF0000', 19)
  // });

});

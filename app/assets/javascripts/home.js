$(document).ready(function(){
	var moodVal = 0 
	$('.ss-sun').on('click', function(){
		moodVal = 1.0

	});
	$('.ss-sunset').on('click', function(){
		moodVal = 0.66

	});
	$('.ss-cloudy').on('click', function(){
		moodVal = 0.33

	});

	$('.ss-rainy').on('click', function(){
		moodVal = -0.33

	});
	$('.ss-storm').on('click', function(){
		moodVal = -0.66
	});

	$('.ss-tornado').on('click', function(){
		moodVal = -1.0
	});
	
	$('#mood-submit').on('click', function(e){
		e.preventDefault();
		var url = '/moods'
		var moodData = {'quantitative': moodVal}
		$.post(url, moodData, function(serverResponse, status, jqXHR) {
			console.log('moodData')
	    });
	})

});
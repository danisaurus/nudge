$(document).ready(function(){
	var moodVal = 0 
	$('.ss-sun').on('click', function(){
		moodVal = 1.0
		console.log(moodVal)
	});
	$('.ss-sunset').on('click', function(){
		moodVal = 0.66
		console.log(moodVal)
	});
	$('.ss-cloudy').on('click', function(){
		moodVal = 0.33
		console.log(moodVal)
	});

	$('.ss-rainy').on('click', function(){
		moodVal = -0.33
		console.log(moodVal)

	});
	$('.ss-storm').on('click', function(){
		moodVal = -0.66
		console.log(moodVal)
	});

	$('.ss-tornado').on('click', function(){
		moodVal = -1.0
		console.log(moodVal)
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
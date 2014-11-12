$(function () {

    var weeklyReport;
    var check_ins = [];
    var gmails = [];
    var tweets = [];
    $.get('/reports', function(response){
        weeklyReport = response;
        for(var i = 0; i < 7; i++){
            check_ins[i] = weeklyReport[i].check_ins;
            gmails[i] = weeklyReport[i].gmails;
            tweets[i] = weeklyReport[i].tweets;
        };
        $('#chart').highcharts({
            title: {
                text: "Your week in review",
                x: -20 //center
            },
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: {
                                day: '%e. %b'
                }
            },
            yAxis: {
                title: {
                    text: 'Sentiment'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: 'Tweets',
                data: tweets,
                pointStart: Date.UTC(2014, 10, 04),
                pointInterval: 24 * 3600 * 1000 // one day
            }, {
                name: 'Emails',
                data: gmails,
                pointStart: Date.UTC(2014, 10, 04),
                pointInterval: 24 * 3600 * 1000 // one day
            }, {
                name: 'Self-report',
                data: check_ins,
                pointStart: Date.UTC(2014, 10, 04),
                pointInterval: 24 * 3600 * 1000 // one day
            }]
        });
    });

});
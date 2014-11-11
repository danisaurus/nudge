$(function () {

    var dailyReport = $.get('')
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
            data: [-0.1, -0.4, 0.2, -0.3, -0.2, 0.0, 0.0],
            pointStart: Date.UTC(2014, 10, 04),
            pointInterval: 24 * 3600 * 1000 // one day
        }, {
            name: 'Emails',
            data: [0.3, -0.1, -0.3, 0.4, -0.3, 0.4, -0.4],
            pointStart: Date.UTC(2014, 10, 04),
            pointInterval: 24 * 3600 * 1000 // one day
        }, {
            name: 'Self-report',
            data: [0.2, 0.2, 0.1, -0.4, 0.2, 0.1, -0.2],
            pointStart: Date.UTC(2014, 10, 04),
            pointInterval: 24 * 3600 * 1000 // one day
        }]
    });
});
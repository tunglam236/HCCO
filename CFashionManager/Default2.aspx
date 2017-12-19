<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Bar Chart</title>
    <script src="http://www.chartjs.org/dist/2.7.0/Chart.bundle.js"></script>
    <script src="http://www.chartjs.org/samples/latest/utils.js"></script>
    <style>
        canvas
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
</head>
<body>
    <select id="sl" onchange="changedrop();">
        <option value="horizontalBar">horizontalBar</option>
        <option value="bar">Bar</option>
        <option value="line" selected>Line</option>
    </select>
    <div style="width: 50%; float:left;">
        <canvas id="canvas1"></canvas>
    </div>
    <div style="width: 45%; float:left;">
        <canvas id="canvas2"></canvas>
    </div>
   <div style="width: 50%; float:left;">
        <canvas id="canvas3"></canvas>
    </div>
    <div style="width: 45%; float:left;">
        <canvas id="canvas4"></canvas>
    </div>
    <script>
        var color = Chart.helpers.color;
        var horizontalBarChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
                label: 'Dataset 1',
                backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
                borderColor: window.chartColors.green,
                borderWidth: 1,
                fill: false,
                data: [45,57,84,93,63,72,84]
            }, {
                label: 'Dataset 2',
                backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
                borderColor: window.chartColors.blue,
                fill: false,
                data: [72,83,73,79,70,90,99]
            }]

        };
        var chartConfig={
                data: horizontalBarChartData,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 2,
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'right',
                    },
                    title: {
                        display: true,
                        text: 'Chart.js Horizontal Bar Chart'
                    },
                    scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        }
                    }]
                  }
                }
            };

        window.onload = function() {
            var ctx1 = document.getElementById('canvas1').getContext("2d");
            var myChart1 = new Chart(ctx1,{type:'line',data:chartConfig.data,options: chartConfig.options});

            var ctx2 = document.getElementById('canvas2').getContext("2d");
            var myChart2 = new Chart(ctx2,{type:'bar',data:chartConfig.data,options: chartConfig.options});

            var ctx3 = document.getElementById('canvas3').getContext("2d");
            var myChart3 = new Chart(ctx3,{type:'horizontalBar',data:chartConfig.data,options: chartConfig.options});

            var ctx4 = document.getElementById('canvas4').getContext("2d");
            var myChart4 = new Chart(ctx4,{type:'doughnut',data:chartConfig.data,options: chartConfig.options});
        };
    </script>
</body>
</html>

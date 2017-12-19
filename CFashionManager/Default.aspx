<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
      <div class="row">
         <div class="col-md-6">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Doanh thu 6 tháng đầu năm 2017</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barChart" style="height:300px"></canvas>
              </div>
            </div>
          </div>
          
        </div>
         <div class="col-md-6">
         <div class="box box-primary">
            <div class="box-header with-border">
              <i class="fa fa-bar-chart-o"></i>
              <h3 class="box-title">Tỉ trọng doanh thu</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              
               <canvas id="donutchart" style="height:300px"></canvas>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
       <div class="col-md-6">
        <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Doanh thu bán hàng</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="lineChart" style="min-height:300px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          </div>
       <div class="col-md-6">
        <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Chi phí 6 tháng đầu năm</h3>
             
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="myChart" style="height: 300px;"></canvas>
              </div>
            </div>
          </div>
          </div>
      </div>
    </section>
    <script>
        var horizontalBarChartData = {
            labels:  ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6","Tháng 7"],
            datasets: [{
                label: 'Doanh thu',
                backgroundColor: 'rgb(255, 159, 64)',
                borderColor:  'rgb(255, 159, 64)',
                borderWidth: 0,
                fill: false,
                data: [45,57,84,93,63,72,84]
            }, {
                label: 'Chi phí',
                backgroundColor: '#059BFF',
                borderColor: '#059BFF',
                fill: false,
                data: [72,83,73,79,70,90,99]
            }, {
                label: 'Lợi nhuận',
                backgroundColor: '#FF6384',
                borderColor: '#FF6384',
                fill: false,
                data: [82,93,43,49,90,80,69]
            }]

        };
        var chartConfig={
                data: horizontalBarChartData,
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 1,
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'right',
                    },
                    tooltips: {
                        position: 'average',
                        mode: 'index',
                        intersect: true
                    },
                    title: {
                        display: true,
                        text: '--'
                    },
                    scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Thời gian'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Giá trị'
                        },
                        ticks: {
                            min: 0,
                            max: 100
                        }
                    }]
                  }
                }
            };
        var config = {
        type: 'pie',
        data: {
            datasets: [{
                data: [23, 30, 27, 10, 10],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)'
                ],
                label: 'Lợi nhuận'
            }],
            labels: ["Nhân sự", "Văn phòng", "Cố định", "Tiếp khách", "CP khác"]
        },
        options: {
            responsive: true,
            legend: {
            position: 'top',
            },
            title: {
                display: true,
                text: '--'
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        }
    };
    
        window.onload = function() {
            var ctx1 = document.getElementById('lineChart').getContext("2d");
            var myChart1 = new Chart(ctx1,{type:'line',data:chartConfig.data,options: chartConfig.options});

            var ctx2 = document.getElementById('barChart').getContext("2d");
            var myChart2 = new Chart(ctx2,{type:'bar',data:chartConfig.data,options: chartConfig.options});

            var ctx3 = document.getElementById('donutchart').getContext("2d");
            var myChart3 = new Chart(ctx3,{type:'horizontalBar',data:chartConfig.data,options: chartConfig.options});

            var ctx4 = document.getElementById('myChart').getContext("2d");
            var myChart4 = new Chart(ctx4, config);

            document.getElementById('update').addEventListener('click', function() {
		       var type = document.getElementById('type').value;
               console.log(type);
// 			    myChart1.config.type = type;
//			    myChart1.update();
                //return false;
		    });
        };
        
    </script>
</asp:Content>

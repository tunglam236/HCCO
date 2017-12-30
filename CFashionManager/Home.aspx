<%@ Page Title="Trang chủ quản trị" Language="C#" MasterPageFile="~/Admin.master"
    AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#sTop").hide();
        });

        function hideRight() {
            $("#sRight").hide();
            $("#sTop").show();
            $("#sLeft").removeClass('col-md-8');
            $("#sLeft").addClass('col-md-12');
        }
        function show() {
            $("#sRight").show();
            $("#sTop").hide();
            $("#sLeft").addClass('col-md-8');
            $("#sLeft").removeClass('col-md-12');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="pull-right" id="sTop" onclick="show();" style="margin: 5px 0px;">
        <span style="cursor: pointer; padding: 5px; border-radius: 5px; background-color: #DD4B39; color: White; font-weight: bold;">Các hoạt động gần đây</span>
    </div>
    <section class="content" style="margin-left:10px">
      <div class="row">
         <div class="col-md-8" id="sLeft">
          <div class="row">
              <div id="cur_datetime" class="col-md-4" style="padding-left:0px; color:#948484; padding-right:0px;margin-bottom:10px; line-height:35px; font-weight:bold;">
              </div>
              <div class="col-md-3" style="padding-left:0px; padding-right:0px;margin-bottom:10px;">
                  <input type="text" id="fromdate" placeholder="Từ ngày" value="" class="form-control datepicker2" style="width:100%;" />
              </div>
              <div class="col-md-3 pl_todate" style="padding-left:10px; padding-right:0px;margin-bottom:10px;">
                <input type="text" id="todate" placeholder="Đến ngày" value="" class="form-control datepicker2" style="width:100%;" />
             </div>
              <div class="col-md-2 pl_todate" style="padding-left:10px; padding-right:0px;margin-bottom:10px;">
                <a href="#" onclick="clickDashboard();" class="btn btn-sm btn-success">Xem báo cáo</a>
             </div>
          </div>
          <div class="row">
                <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-bar-chart"></i> Kết quả bán hàng</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon" style="height:98px;"><i class="fa fa-calendar" style="margin-top:25px;"></i></span>
            <div class="info-box-content" style="height:98px;">
              <span class="info-box-text">Số hóa đơn</span>
              <span class="info-box-number" id="bill_total">loading...</span>
              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description" style="font-size:11px;" id="bill_des">
                    loading...
                  </span>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon" style="height:98px;"><i class="fa fa-shopping-cart" style="margin-top:25px;"></i></span>
            <div class="info-box-content" style="height:98px;">
              <span class="info-box-text">Số sản phẩm bán</span>
              <span class="info-box-number" id="pro_count">loading...</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></%"></div>
              </div>
                  <span class="progress-description" style="font-size:11px;" id="pro_des">
                    loading...
                  </span>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-red">
            <span class="info-box-icon" style="height:98px;"><i class="fa fa-money" style="margin-top:25px;"></i></span>

            <div class="info-box-content" style="height:98px;">
              <span class="info-box-text">Doanh thu</span>
              <span class="info-box-number" id="reve_total">loading...</span>
              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description" style="font-size:11px;" id="reve_des">
                    loading...
                  </span>
            </div>
          </div>
        </div>
      </div>
            </div>
          </div>
          </div>
          <div class="row">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-line-chart"></i> Doanh thu bán hàng</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="RevenueWeek" style="height:350px"></canvas>
              </div>
            </div>
          </div>
          </div>
          <div class="row">
                <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-pie-chart"></i> Số lượng hóa đơn bán ra</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="lineChart" style="height:350px"></canvas>
              </div>
            </div>
          </div>
          </div>
          <div class="row">
                <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-sort-numeric-asc"></i> Top sản phẩm C'Fashion bán ra</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barWeek" style="height:350px"></canvas>
              </div>
            </div>
          </div>
          </div>
          <div class="row">
                <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-sort-numeric-asc"></i> Top sản phẩm C'Nice bán ra</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barWeek2" style="height:350px"></canvas>
              </div>
            </div>
          </div>
          </div>
        </div>
         <div class="col-md-4" id="sRight">
          <ul id="ultimeline" class="timeline" style="background:#ffffff; padding-bottom:45px;">
            <li class="time-label">
                  <span class="bg-red" onclick="hideRight();" style="cursor:pointer;">
                    Các hoạt động gần đây
                  </span>
            </li>
          </ul>
        </div>
      </div>
      </section>
    <script type="text/javascript">
        function setdatetime() {
            var objToday = new Date(),
            weekday = new Array('Chủ nhật', 'Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ 5', 'Thứ 6', 'Thứ 7'),
            dayOfWeek = weekday[objToday.getDay()],
            dayOfMonth = today + (objToday.getDate() < 10) ? '0' + objToday.getDate() : objToday.getDate(),
            months = new Array('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'),
            curMonth = months[objToday.getMonth()],

            curYear = objToday.getFullYear(),
            curHour = objToday.getHours() > 12 ? objToday.getHours() : (objToday.getHours() < 10 ? "0" + objToday.getHours() : objToday.getHours()),
            curMinute = objToday.getMinutes() < 10 ? "0" + objToday.getMinutes() : objToday.getMinutes(),
            curSeconds = objToday.getSeconds() < 10 ? "0" + objToday.getSeconds() : objToday.getSeconds(),
            curMeridiem = objToday.getHours() > 12 ? "PM" : "AM";

            var today = 'Hôm nay, ' + dayOfWeek + ' - ' + dayOfMonth + '/' + curMonth + '/' + curYear + ' ' + curHour + ':' + curMinute + ':' + curSeconds;
            document.getElementById('cur_datetime').innerHTML = today;
            

        }
        setInterval(setdatetime, 1000);
        getLog();
        function getLog() {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadLog',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var html = '';
                    $('#ultimeline li').remove();
                    html = '<li class="time-label">'+
                    '<span class="bg-red" onclick="hideRight();" style="cursor:pointer;">'+
                    'Các hoạt động gần đây</span></li>';
                    $('#ultimeline').append(html);
                    var color = ['bg-blue', 'bg-green', 'bg-yellow'];
                    for (var i = 0; i < data.d.length; i++) {
                        html = '<li><i class="fa fa-hashtag '+color[i%3]+'"></i>' +
                        '<div class="timeline-item">' +
                        '<h3 class="timeline-header"><a href="#">' + data.d[i]._mess + '</a></h3>' +
                        '<div class="timeline-body">' + data.d[i]._content +
                        '</div></div></li>';

                        $('#ultimeline').append(html);
                    }
                    //html = '<li><i class="fa fa-clock-o bg-gray"></i></li>';
                    //$('#ultimeline').append(html);
                }
            });
        }
        //setInterval(getLog, 30000);
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var someDate = new Date();
            var previous = someDate.addDays(-7);

            var d = someDate.getDate();
            var m = someDate.getMonth() + 1;
            var y = someDate.getFullYear();

            var pred = previous.getDate();
            var prem = previous.getMonth() + 1;
            var prey = previous.getFullYear();

            $('#fromdate').val(pred + '/' + prem + '/' + prey);
            $('#todate').val(d + '/' + m + '/' + y);

            loadDashboard();
            loadDashboardBill();
            loadTopProduct('1');
            loadTopProduct('2');
            loadTagDiv();
            
        });
        Date.prototype.addDays = function (num) {
            var value = this.valueOf();
            value += 86400000 * num;
            return new Date(value);
        }
        function loadDashboard() {
            var branchType = '';
            var fromdate = $('#fromdate').val();
            var todate = $('#todate').val();

            var min_stick = 100000;

            var _options = {
                elements: {
                    rectangle: {
                        borderWidth: 1,
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    position: 'bottom',
                },
                tooltips: {
                    position: 'average',
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function (tooltipItem, data) {
                            return data.datasets[tooltipItem.datasetIndex].label + ': ' + tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");;
                        }
                    }
                },
                title: {
                    display: true,
                    text: 'Kết quả từ ' + fromdate + ' đến ' + todate
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
                            display: true
                        },
                        ticks: {
                            min: min_stick,
                            callback: function (value, index, values) {
                                return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            }
                        }
                    }]
                }
            };
            var _label = [], _list = [], _data1 = [], _ser = [], _series = [];
            if (fromdate != '' && todate != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/loadDashboardRevenue',
                    data: '{"branchType":"' + branchType + '","fromdate":"' + fromdate + '","todate":"' + todate + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var html = '';
                        for (var i = 0; i < data.d.length; i++) {
                            if (_label.indexOf(data.d[i].CreateAt) == -1)
                                _label.push(data.d[i].CreateAt);

                            if (_series.indexOf(data.d[i].BranchTypeName) == -1) {
                                _ser.push({ id: data.d[i].Id, name: data.d[i].BranchTypeName });
                                _series.push(data.d[i].BranchTypeName);
                            }

                            _data1.push({ id: data.d[i].Id, data: data.d[i].RevenueValue });
                        }
                        var color = ["rgb(255, 159, 64)", "#059BFF","#FF6384"];

                        for (var i = 0; i < _ser.length; i++) {
                            var list_data = _data1.filter(x => x.id === _ser[i].id).map(x => x.data);
                            
                            var obj = { label: _ser[i].name, backgroundColor: color[i], borderColor: "rgb(255, 159, 64)", borderWidth: 0, fill: false, data: list_data };
                            _list.push(obj);
                        }

                        var revenueWeek = {
                            data: {
                                labels: _label,
                                datasets: _list
                            }
                        };

                        var ctx2 = document.getElementById('RevenueWeek').getContext("2d");
                        var myChart2 = new Chart(ctx2, { type: 'bar', data: revenueWeek.data, options: _options });
                    }
                });
            }
        }
        function loadDashboardBill() {
            var branchType = '';
            var fromdate = $('#fromdate').val();
            var todate = $('#todate').val();

            var min_stick = 0;

            var _options = {
                elements: {
                    rectangle: {
                        borderWidth: 1,
                    }
                },
                responsive: true,
                legend: {
                    position: 'bottom',
                },
                tooltips: {
                    position: 'average',
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function (tooltipItem, data) {
                            return data.datasets[tooltipItem.datasetIndex].label + ': ' + tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        }
                    }
                },
                title: {
                    display: true,
                    text: 'Kết quả từ ' + fromdate + ' đến ' + todate
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
                            display: true
                        },
                        ticks: {
                            min: min_stick
                        }
                    }]
                }
            };
            var _label = [], _list = [], _data1 = [], _ser = [], _series = [];
            if (fromdate != '' && todate != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/loadDashboardBill',
                    data: '{"branchType":"' + branchType + '","fromdate":"' + fromdate + '","todate":"' + todate + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var html = '';
                        for (var i = 0; i < data.d.length; i++) {
                            if (_label.indexOf(data.d[i].CreateAt) == -1)
                                _label.push(data.d[i].CreateAt);

                            if (_series.indexOf(data.d[i].BranchTypeName) == -1) {
                                _ser.push({ id: data.d[i].Id, name: data.d[i].BranchTypeName });
                                _series.push(data.d[i].BranchTypeName);
                            }

                            _data1.push({ id: data.d[i].Id, data: data.d[i].RevenueValue });
                        }
                        var color = ["rgb(255, 159, 64)", "#059BFF", "#FF6384"];

                        for (var i = 0; i < _ser.length; i++) {
                            var list_data = _data1.filter(x => x.id === _ser[i].id).map(x => x.data);
                            
                            var obj = { label: _ser[i].name, backgroundColor: color[i], borderColor: "rgb(255, 159, 64)", borderWidth: 0, fill: false, data: list_data };
                            _list.push(obj);
                        }
                        var revenueWeek = {
                            data: {
                                labels: _label,
                                datasets: _list
                            }
                        };

                        var ctx1 = document.getElementById('lineChart').getContext("2d");
                        var myChart1 = new Chart(ctx1, { type: 'line', data: revenueWeek.data, options: _options });

                    }
                });
            }
        }
        function loadTagDiv() {
            var branchType = '';
            var fromdate = $('#fromdate').val();
            var todate = $('#todate').val();

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadDashboard',
                data: '{"branchType":"' + branchType + '","fromdate":"' + fromdate + '","todate":"' + todate + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var total1 = 0, total2 = 0, total3 = 0;
                    var des1 = '', des2 = '', des3 = '';
                    for (var i = 0; i < data.d.length; i++) {
                        total1 += data.d[i].num_count;
                        total2 += data.d[i].num_quantity;
                        total3 += data.d[i].num_total;

                        if (des1 != '') des1 += '</br>';
                        des1 += data.d[i].Name + ': ' + data.d[i].Count;

                        if (des2 != '') des2 += '</br>';
                        des2 += data.d[i].Name + ': ' + data.d[i].Quantity;

                        if (des3 != '') des3 += '</br>';
                        des3 += data.d[i].Name + ': ' + data.d[i].TotalPrice;
                    }
                    $('#bill_total').html(total1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    $('#pro_count').html(total2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    $('#reve_total').html(total3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

                    $('#bill_des').html(des1);
                    $('#pro_des').html(des2);
                    $('#reve_des').html(des3);
                }
            });
        }
        function loadTopProduct(branchType) {
            var branchType = branchType;
            var fromdate = $('#fromdate').val();
            var todate = $('#todate').val();

            var Config = {
                options: {
                    elements: {
                        rectangle: {
                            borderWidth: 1,
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'right',
                        display: false,
                    },
                    tooltips: {
                        position: 'average',
                        mode: 'index',
                        intersect: false,
                        callbacks: {
                            label: function (tooltipItem, data) {
                                var values = tooltipItem.yLabel;
                                var index = tooltipItem.index;
                                var name = data.labels[tooltipItem.index];

                                var k = name.indexOf('#') + 1;
                                var d = name.substring(k, name.length) + ': ' + values;
                                return d;
                            }
                        }
                    },
                    title: {
                        display: true,
                        text: 'Kết quả từ ' + fromdate + ' đến ' + todate
                    },
                    scales: {
                        xAxes: [{
                            barPercentage: 0.4,
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Mã sản phẩm'
                            },
                            ticks: {
                                callback: function (value, index, values) {
                                    var p = value;
                                    var k = p.indexOf('#');
                                    var d = p.substring(0, k);
                                    return d;
                                }
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Số lượng bán ra'
                            },
                            ticks: {
                                min: 0,
                                beginAtZero: false,
                                callback: function (value, index, values) {
                                    if (Math.floor(value) === value) {
                                        return value;
                                    }
                                }
                            }
                        }]
                    }
                }
            };
            var _label = [], _list = [], _data1 = [];
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadDashboardTopProduct',
                data: '{"branchType":"' + branchType + '","fromdate":"' + fromdate + '","todate":"' + todate + '","type":"1"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var html = '';
                    for (var i = 0; i < data.d.length; i++) {
                        if (_label.indexOf(data.d[i]._id + '#' + data.d[i]._content) == -1)
                            _label.push(data.d[i]._id + '#' + data.d[i]._content);

                        _data1.push(parseInt(data.d[i]._mess));
                    }
                    var color = "rgb(255, 159, 64)";
                    if (branchType == '2') color = "#059BFF";

                    var obj = { label: "Số lượng", backgroundColor: color, borderColor: "rgb(255, 159, 64)", borderWidth: 0, fill: false, data: _data1 };
                    _list.push(obj);

                    var revenueWeek = {
                        data: {
                            labels: _label,
                            datasets: _list
                        }
                    };
                    if (branchType == '2') {
                        var ctx5 = document.getElementById('barWeek').getContext("2d");
                        var myChart5 = new Chart(ctx5, { type: 'bar', data: revenueWeek.data, options: Config.options });
                    }
                    else {
                        var ctx6 = document.getElementById('barWeek2').getContext("2d");
                        var myChart6 = new Chart(ctx6, { type: 'bar', data: revenueWeek.data, options: Config.options });
                    }
                }
            });


        }
        function clickDashboard() {
            loadDashboard();
            loadDashboardBill();
            loadTopProduct('1');
            loadTopProduct('2');
            loadTagDiv();
        }
    </script>
    
</asp:Content>

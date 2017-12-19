<%@ Page Title="Báo cáo doanh thu cuối ngày" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="LastRevenue.aspx.cs" Inherits="LastRevenue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .pr {
            padding-right: 0px;
        }

        td.childrows {
            background: url('/dist/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }

        tr.shown td.childrows {
            background: url('/dist/img/details_close.png') no-repeat center center;
        }

        #tbdetail tr td {
            border-bottom: 1px solid #ccc;
            line-height: 35px;
        }

        label {
            font-weight: normal;
            cursor: pointer;
            font-size: 13px;
        }

        .list-group-item {
            padding: 7px 15px;
        }

        .bg-th {
            background-color: #F9F9F9;
        }

        .detail-rows {
            cursor: pointer;
        }

        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

            .dropbtn:hover, .dropbtn:focus {
                background-color: #3e8e41;
            }

        #myInput {
            border-box: box-sizing;
            background-image: url('searchicon.png');
            background-position: 14px 12px;
            background-repeat: no-repeat;
            font-size: 16px;
            padding: 14px 20px 12px 45px;
            border: none;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f6f6f6;
            min-width: 230px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }

        .rdList {
            margin: 5px;
            width: 95%;
        }

            .rdList tr td {
                border-bottom: 1px solid #ccc;
                padding: 10px 0px;
            }

        .detail-rows:hover, #tbdetail tr:hover {
            background-color: whitesmoke !important;
        }

        .format-input {
            width: 55px;
            height: 25px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content" style="margin-left:10px">
    <div class="row">
      <div class="col-xs-12 col-md-12">
      <section class="">
       <div class="pull-left">
          <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-line-chart"></i> Báo cáo doanh thu</h3>
       </div>
       <div style="text-align:right; padding-bottom:10px;">
          <div class="dropdown">
          <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> In báo cáo</button>
            
        </div>
       </div>
      </section>
      <div class="row">
              <div class="col-md-3 col-sm-6 col-xs-12" style="padding-right:0px;margin-bottom:10px;">
                   <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                   </select>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12" style="padding-right:0px;margin-bottom:10px;">
                   <select id="dlBranch" class="form-control select2" onchange="loadData()" style="width: 100%;">
                   </select>
              </div>
                <div class="col-md-2 col-sm-6 col-xs-12" style="padding-right:0px;margin-bottom:10px;">
                  <input type="text" id="txtFromDate" value="" class="form-control datepicker2" style="width:100%" />
              </div>
              <div class="col-md-2 col-sm-6 col-xs-12" style="padding-right:0px;margin-bottom:10px;">
                  <input type="text" id="txtToDate" value="" class="form-control datepicker2" style="width:100%" />
              </div>
                <div class="col-md-2 col-sm-6 col-xs-12" style="padding-right:0px;margin-bottom:10px;">
                  <a href="#" onclick="return loadData();" class="btn btn-sm btn-default" style="width:100%;">Xem báo cáo</a>
              </div>
          </div>
      <div class="row" id="list-data">
      </div>
      <div class="row">
              <div class="col-md-12 pr">
          <div class="box box-primary">
           <div class="box-header">
              <i class="fa fa-line-chart"></i>
              <h3 class="box-title">Số liệu chi tiết</h3>
              <div class="box-tools pull-right">
                <ul class="pagination pagination-sm inline">
                  <li><a href="#">«</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">»</a></li>
                </ul>
              </div>
            </div>
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin table-hover table-bordered" style="font-size:12px;">
                  <thead>
                  <tr>
                    <th>STT</th>
                    <th>Chuỗi</th>
                    <th>Chi nhánh</th>
                    <th>Ngày</th>
                    <th class="right">Doanh thu</th>
                  </tr>
                  </thead>
                  <tbody id="rows-data">
                  </tbody>
                </table>
              </div>
            </div>
            </div>
          </div>
          </div>
      </div>
   </div>
    </section>
    <script>
        function changeType(id) {
            loadBranchbyType(id);
        }
        function loadBranchbyType(id) {
            $('#dlBranch').find('option').remove().end();
            var c1 = document.getElementById('dlBranch');

            var opt2 = document.createElement('option');
            opt2.value = "";
            opt2.innerHTML = "Tất cả chi nhánh";
            c1.appendChild(opt2);

            if (id != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getBranchByType',
                    data: '{"typeId":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i]._content;
                            opt.innerHTML = data.d[i]._mess;
                            c1.appendChild(opt);
                        }

                    }
                });
            }
            loadData();
        }
        function loadData() {
            var branchType = $('#dlBranchType').val();
            var branch = $('#dlBranch').val();
            var fromdate = $('#txtFromDate').val();
            var todate = $('#txtToDate').val();

            var _branchtype = [], _branch = [];

            if (fromdate != '' && todate != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/loadRevenue',
                    data: '{"branchType":"' + branchType + '","branchId":"' + branch + '","fromdate":"' + fromdate + '","todate":"' + todate + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        $('#rows-data tr').remove();
                        var html_list = '', html_total = '', html_branchtype = '', html_branch = '';
                        $('#list-data .pr').remove();

                        var total_revenue = 0;
                        for (var i = 0; i < data.d.length; i++) {

                            var data_branchtype = _branchtype.find(item => item.name === data.d[i].BranchTypeName);
                            if (data_branchtype) {
                                data_branchtype.value = data_branchtype.value + data.d[i].Total;
                            }
                            else {
                                var obj = {};
                                obj.name = data.d[i].BranchTypeName;
                                obj.value = data.d[i].Total;
                                _branchtype.push(obj);
                            }

                            var data_branch = _branch.find(item => item.name === data.d[i].BranchName);
                            if (data_branch) {
                                data_branch.value = data_branch.value + data.d[i].Total;
                            }
                            else {
                                var obj = {};
                                obj.name = data.d[i].BranchName;
                                obj.value = data.d[i].Total;
                                _branch.push(obj);
                            }

                            total_revenue += data.d[i].Total;
                            html_list += '<tr><td>' + (i + 1) + '</td><td><span class="label label-success">' + data.d[i].BranchTypeName + '</span></td><td>' + data.d[i].BranchName + '</td><td>' + data.d[i].CreateAt + '</td><td class="right">' + data.d[i].RevenueValue + '</td></tr>';
                        }
                        html_total += '<div class="col-md-4 col-sm-6 col-xs-12 pr"><div class="info-box bg-green"><span class="info-box-icon"><i class="fa fa-hashtag" style="margin-top:20px;"></i></span><div class="info-box-content">';
                        html_total += '<span class="info-box-text">Tổng doanh thu</span><span class="info-box-number" id="totalrevenue">' + total_revenue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span><div class="progress"><div class="progress-bar" style="width: 100%"></div></div><span class="progress-description">';
                        html_total += 'Tổng doanh thu toàn chuỗi</span></div></div></div>';

                        for (var t = 0; t < _branchtype.length; t++) {
                            html_branchtype += '<div class="col-md-4 col-sm-6 col-xs-12 pr"><div class="info-box bg-yellow"><span class="info-box-icon"><i class="fa fa-sitemap" style="margin-top:20px;"></i></span><div class="info-box-content">';
                            html_branchtype += '<span class="info-box-text">Tổng ' + _branchtype[t].name + '</span>';
                            html_branchtype += '<span class="info-box-number">' + _branchtype[t].value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>';
                            html_branchtype += '<div class="progress"><div class="progress-bar" style="width: 100%"></div></div>';
                            html_branchtype += '<span class="progress-description">Tổng doanh thu ' + _branchtype[t].name + '</span></div></div></div>';
                        }

                        for (var t = 0; t < _branch.length; t++) {
                            html_branch += '<div class="col-md-4 col-sm-6 col-xs-12 pr"><div class="info-box bg-red"><span class="info-box-icon"><i class="fa fa-crosshairs" style="margin-top:20px;"></i></span><div class="info-box-content">';
                            html_branch += '<span class="info-box-text">Tổng ' + _branch[t].name + '</span>';
                            html_branch += '<span class="info-box-number">' + _branch[t].value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>';
                            html_branch += '<div class="progress"><div class="progress-bar" style="width: 100%"></div></div>';
                            html_branch += '<span class="progress-description">Tổng doanh thu cửa hàng</span></div></div></div>';
                        }

                        $('#rows-data').append(html_list);
                        $('#list-data').append(html_total + html_branchtype + html_branch);
                    }
                });

            }
            else showAlert('Nhập khoảng thời gian xem');
            return false;
        }
        function search(nameKey, myArray) {
            for (var i = 0; i < myArray.length; i++) {
                if (myArray[i].name === nameKey) {
                    return myArray[i];
                }
            }
        }

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var someDate = new Date();

            var d = someDate.getDate();
            var m = someDate.getMonth() + 1;
            var y = someDate.getFullYear();

            $('#txtFromDate').val(d + '/' + m + '/' + y);
            $('#txtToDate').val(d + '/' + m + '/' + y);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getBranchType',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlBranchType');
                    var opt2 = document.createElement('option');
                    opt2.value = "";
                    opt2.innerHTML = "Tất cả chuỗi";
                    c1.appendChild(opt2);

                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                    loadBranchbyType($('#dlBranchType').val());
                }
            });
        });
        Date.prototype.addDays = function (num) {
            var value = this.valueOf();
            value += 86400000 * num;
            return new Date(value);
        }
    </script>

</asp:Content>


<%@ Page Title="Báo cáo xuất hàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="LastDay.aspx.cs" Inherits="LastDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .pr {
            padding-right: 0px;
        }

        .pl {
            padding-left: 0px;
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
            background-color: #27ae6078 !important;
        }

        .format-input {
            width: 55px;
            height: 25px;
            text-align: center;
        }

        table#example2 tbody tr.selected {
            background-color: #27ae6078;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content" style="margin-left: 10px">
   <div class="row">
      <div class="col-xs-12 col-md-2" style=" padding:10px;">
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse4">Chuỗi cửa hàng</a>
            </h4>
          </div>
          <div id="collapse4" class="panel-collapse">
              <asp:RadioButtonList ID="rdBranchType" AutoPostBack="true" OnSelectedIndexChanged="rdBranchType_SelectedIndexChanged" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
     <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Chi nhánh</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse">
              <asp:RadioButtonList ID="rdBranch" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
       <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse1">Thời gian</a>
            </h4>
          </div>
          <div id="collapse1" class="panel-collapse" style="padding:5px;">
            <ul class="list-group">
              <li class="list-group-item"><label>Từ ngày</label>
              <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control datepicker2" Width="99%"></asp:TextBox>
              </li>
              <li class="list-group-item"><label>Đến ngày</label>
                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control datepicker2" Width="99%"></asp:TextBox>
              </li>
            </ul>
              <asp:Button ID="btnSearch" OnClick="btnSubmit_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
       <div class="pull-left">
          <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-bar-chart"></i> Báo cáo bán hàng</h3>
       </div>
       <div style="text-align:right; padding-bottom:10px;">
          <div class="dropdown">
          <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
            <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
                <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã CN</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chi nhánh</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày xuất</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số hóa đơn</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã KH</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Khách hàng</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Địa chỉ</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Điện thoại</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;NV xuất hàng</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã NVBH</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên nhân viên</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="12" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã hàng</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="13" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên hàng</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="14" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đơn vị tính</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="15" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số lượng</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="16" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đơn giá</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="17" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;% CK</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="18" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chiết khấu SP</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="19" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thành tiền CK</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="20" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thành tiền</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="21" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;% CK hóa đơn</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="22" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;CK hóa đơn</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="23" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tổng hóa đơn</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="24" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;KH thanh toán</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="25" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trả lại</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="26" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Hình thức</label> </a></li>
                <li><a href="#" class="small toggle-vis" data-column="27" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ghi chú</label> </a></li>
            </ul>
        </div>
           <h4><i class="fa fa-money"></i> Tổng doanh thu: <asp:Literal ID="lbTongTien" runat="server" Text="100,000,000 đ"></asp:Literal></h4>
       </div>
      </section>
        <div class="box box-warning">
        <div class="box-header" style="text-align:right;">
        </div>
        <div class="box-body">
            <div style="max-width:1366px; overflow:auto;">
            <table id="example2" class="table cell-border" style="font-size:12px;min-width:3200px;">
                <thead>
                      <tr>
                        <th colspan="12" class="center" style="border:1px solid #ccc;">Thông tin hóa đơn</th>
                        <th colspan="8" class="center" style="border:1px solid #ccc;">Thông tin sản phẩm</th>
                        <th colspan="8" class="center" style="border:1px solid #ccc;">Thông tin thanh toán</th>
                    </tr>
                    <tr>
                    <th class='bg-th center' width="40px"></th>
                    <th class="bg-th">Mã CN</th>
                    <th class="bg-th">Chi nhánh</th>
                    <th class="bg-th">Ngày</th>
                    <th class="bg-th">Số HĐ</th>
                    <th class="bg-th">Mã KH</th>
                    <th class="bg-th">Khách hàng</th>
                    <th class="bg-th">Địa chỉ</th>
                    <th class="bg-th">Điện thoại</th>
                    <th class="bg-th">NV xuất hàng</th>
                    <th class="bg-th">Mã NVBH</th>
                    <th class="bg-th">Tên nhân viên</th>
                    <th class="bg-th">Mã hàng</th>
                    <th class="bg-th">Tên hàng</th>
                    <th class="bg-th">ĐVT</th>
                    <th class="bg-th">SL</th>
                    <th class="bg-th">Đơn giá</th>
                    <th class="bg-th">% CKSP</th>
                    <th class="bg-th">Chiết khấu SP</th>
                    <th class="bg-th">Thành tiền SP</th>
                    <th class="bg-th">Thành tiền</th>
                    <th class="bg-th">% CK hóa đơn</th>
                    <th class="bg-th">CK hóa đơn</th>
                    <th class="bg-th">Tổng hóa đơn</th>
                    <th class="bg-th">KH thanh toán</th>
                    <th class="bg-th">Trả lại</th>
                    <th class="bg-th">Hình thức</th>
                    <th class="bg-th">Ghi chú</th>
                    </tr>
                </thead>
                <tbody id="rbody">
                <asp:Literal ID="lbData" runat="server"></asp:Literal>
                </tbody>
                <tfoot>
                    <tr>
                    <th class='bg-th center' width="40px"></th>
                    <th class="bg-th">Mã CN</th>
                    <th class="bg-th">Chi nhánh</th>
                    <th class="bg-th">Ngày</th>
                    <th class="bg-th">Số HĐ</th>
                    <th class="bg-th">Mã KH</th>
                    <th class="bg-th">Khách hàng</th>
                    <th class="bg-th">Địa chỉ</th>
                    <th class="bg-th">Điện thoại</th>
                    <th class="bg-th">NV xuất hàng</th>
                    <th class="bg-th">Mã NVBH</th>
                    <th class="bg-th">Tên nhân viên</th>
                    <th class="bg-th">Mã hàng</th>
                    <th class="bg-th">Tên hàng</th>
                    <th class="bg-th">ĐVT</th>
                    <th class="bg-th">SL</th>
                    <th class="bg-th">Đơn giá</th>
                    <th class="bg-th">% CKSP</th>
                    <th class="bg-th">Chiết khấu SP</th>
                    <th class="bg-th">Thành tiền SP</th>
                    <th class="bg-th">Thành tiền</th>
                    <th class="bg-th">% CK hóa đơn</th>
                    <th class="bg-th">CK hóa đơn</th>
                    <th class="bg-th">Tổng hóa đơn</th>
                    <th class="bg-th">KH thanh toán</th>
                    <th class="bg-th">Trả lại</th>
                    <th class="bg-th">Hình thức</th>
                    <th class="bg-th">Ghi chú</th>
                    </tr>
                </tfoot>
            </table>
                </div>
        </div>
        </div>
      </div>
   </div>
</section>
    <script>
        var options = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"];

        $('.ul-column a').on('click', function (event) {

            var $target = $(event.currentTarget),
            val = $target.attr('data-column'),
            $inp = $target.find('input');
            var idx = 0;

            if ((idx = options.indexOf(val)) > -1) {
                options.splice(idx, 1);
                setTimeout(function () { $inp.prop('checked', false) }, 0);
            } else {
                options.push(val);
                setTimeout(function () { $inp.prop('checked', true) }, 0);
            }

            $(event.target).blur();
            return false;
        });
    </script>
    <script>
        $(window).load(function () {
            var table = $('#example2').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "pageLength": 10,
                //"drawCallback": function (settings) {
                //    var api = this.api();
                //    var rows = api.rows({ page: 'current' }).nodes();
                //    var last = null;

                //    api.column(4, { page: 'current' }).data().each(function (group, i) {
                //        if (last !== group) {
                //            $(rows).eq(i).before(
                //                '<tr class="group"><td colspan="3" style="text-transform: uppercase;"><b>Số hóa đơn : ' + group + '</b></td></tr>'
                //            );
                //            last = group;
                //        }
                //    });
                //},
                "autoWidth": false,
                "order": [[4, 'desc']],
                "columnDefs": [
                  {
                      "targets": [27],
                      "visible": false,
                      "searchable": false
                  }],
                dom: 'Bfrtip',

                buttons: [
                    {
                        extend: 'copyHtml5',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
			        {
			            extend: 'excelHtml5',
			            exportOptions: {
			                columns: ':visible'
			            }
			        }],
                language: {
                    buttons: {
                        copy: 'Copy',
                        print: 'Print',
                        excel: 'Export'
                    }
                }
            });

            $('#example2 tbody').on('click', 'tr', function () {
                $(this).toggleClass('selected');
            });

            $('a.toggle-vis').on('click', function (e) {
                e.preventDefault();
                var column = table.column($(this).attr('data-column'));
                column.visible(!column.visible());
            });

            $('#example2 tbody').on('click', 'tr.detail-rows', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);
                if (row.child.isShown()) {
                    row.child.hide();
                    tr.removeClass('shown');
                }
            });
        });
    </script>
</asp:Content>


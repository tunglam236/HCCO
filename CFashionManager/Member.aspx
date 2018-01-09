<%@ Page Title="Danh mục khách hàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
   <div class="row">
   <div class="col-xs-12 col-md-2" style=" padding:10px;">
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Chuỗi cửa hàng</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse">
              <asp:RadioButtonList ID="rdBranchType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
        <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a href="#">Trạng thái mua hàng</a>
            </h4>
          </div>
          <div class="panel-collapse" style="padding:5px;">
          <asp:RadioButtonList ID="rdBuy" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                <asp:ListItem Value="" Selected="True"> Tất cả</asp:ListItem>
                <asp:ListItem Value="1"> Đã mua hàng</asp:ListItem>
                <asp:ListItem Value="2"> Chưa mua hàng</asp:ListItem>
              </asp:RadioButtonList>
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-user"></i> Danh sách khách hàng </h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chuỗi</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã khách hàng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên khách hàng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày sinh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Giới tính</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Địa chỉ</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Điện thoại</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ghi chú</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người tạo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày tạo</label> </a></li>
        </ul>
    </div>
       </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1000px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Mã khách hàng</th>
                        <th class="bg-th">Tên khách hàng</th>
                        <th class="bg-th">Ngày sinh</th>
                        <th class="bg-th">Giới tính</th>
                        <th class="bg-th">Địa chỉ</th>
                        <th class="bg-th">Điện thoại</th>
                        <th class="bg-th">Ghi chú</th>
                         <th class="bg-th">Người tạo</th>
                        <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                         <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Mã khách hàng</th>
                        <th class="bg-th">Tên khách hàng</th>
                        <th class="bg-th">Ngày sinh</th>
                        <th class="bg-th">Giới tính</th>
                        <th class="bg-th">Địa chỉ</th>
                        <th class="bg-th">Điện thoại</th>
                        <th class="bg-th">Ghi chú</th>
                         <th class="bg-th">Người tạo</th>
                        <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
  <img class="crop-loading" src="/dist/img/crop.gif" style="display:none;position:fixed; top:50%; left:50%" />
</section>

    <script>
        var options = ["1", "2", "3", "4", "5", "6", "7"];

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
                "pageLength": 20,
                "autoWidth": false,
                "order": [[0, 'asc']],
                "columnDefs": [
                {
                    "targets": [8, 9, 10],
                    "visible": false,
                    "searchable": false
                }],
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copyHtml5',
                        text: 'Copy',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'print',
                        text: 'Print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
			        {
			            extend: 'excelHtml5',
			            text: 'Export',
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
                else {
                    var id = row.selector.rows.prevObject.context.id;
                    var html = '';
                    $('.crop-loading').show();
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/loadHistoryMember',
                        data: '{"memberId":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr>';
                                data_html += '<td>' + (i + 1).toString() + '</td>';
                                data_html += '<td>' + data.d[i].CreateAt + '</td>';
                                data_html += '<td>' + data.d[i].StockCode + '</td>';
                                data_html += '<td>' + data.d[i].CodeId + '</td>';
                                data_html += '<td>' + data.d[i].ProCode + '</td>';
                                data_html += '<td>' + data.d[i].ProName + '</td>';
                                data_html += '<td>' + data.d[i].Quantity + '</td>';
                                data_html += '<td>' + data.d[i].Price + '</td>';
                                data_html += '<td>' + data.d[i].Note + '</td>';
                                data_html += '</tr>';

                            }
                            html = '<div style="max-height: 300px;overflow-y: auto; background-color:#91f5d4;"><table id="tbdetail" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;width:95%; margin-left:25px;">' +
                                    '<tr>' +
                                        '<td class="bold" width="30px">STT</td>' +
                                        '<td class="bold">Ngày mua hàng</td>' +
                                        '<td class="bold">Số hóa đơn</td>' +
                                        '<td class="bold">Mã vạch</td>' +
                                        '<td class="bold">Mã sản phẩm</td>' +
                                        '<td class="bold">Tên sản phẩm</td>' +
                                        '<td class="bold">Số lượng</td>' +
                                        '<td class="bold">Đơn giá</td>' +
                                        '<td class="bold">Ghi chú</td>' +
                                    '</tr>' + data_html +
                                '</table></div>';


                            row.child(html).show();
                            tr.addClass('shown');
                            $('.crop-loading').hide();
                        }
                    });
                }
            });
        });
    </script>
   
</asp:Content>

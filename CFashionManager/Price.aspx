<%@ Page Title="Quản lý giá bán" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Price.aspx.cs" Inherits="Price" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        td.childrows
        {
            background: url('/dist/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }
        tr.shown td.childrows
        {
            background: url('/dist/img/details_close.png') no-repeat center center;
        }
        #tbdetail tr td
        {
            border-bottom: 1px solid #ccc;
            line-height:35px;
        }
        label
        {
            font-weight: normal;
            cursor: pointer;
            font-size: 13px;
        }
        .list-group-item
        {
            padding: 7px 15px;
        }
        .bg-th
        {
            background-color: #F9F9F9;
        }
        .detail-rows
        {
            cursor: pointer;
        }
        
        .dropbtn
        {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        
        .dropbtn:hover, .dropbtn:focus
        {
            background-color: #3e8e41;
        }
        #myInput
        {
            border-box: box-sizing;
            background-image: url('searchicon.png');
            background-position: 14px 12px;
            background-repeat: no-repeat;
            font-size: 16px;
            padding: 14px 20px 12px 45px;
            border: none;
        }
        
        .dropdown
        {
            position: relative;
            display: inline-block;
        }
        
        .dropdown-content
        {
            display: none;
            position: absolute;
            background-color: #f6f6f6;
            min-width: 230px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        
        .dropdown-content a
        {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        
        .dropdown a:hover
        {
            background-color: #ddd;
        }
        .pl { padding-left:25px;}
        .show
        {
            display: block;
        }
        .rdList { margin:5px; width:95%;}
        .rdList tr td { border-bottom:1px solid #ccc; padding:10px 0px;}
        .detail-rows:hover,#tbdetail tr:hover {background-color: lavender !important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
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
              <asp:RadioButtonList ID="rdBranchType" AutoPostBack="true" OnSelectedIndexChanged="rdBranchType_SelectedIndexChanged" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
        <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse3">Nhóm sản phẩm</a>
            </h4>
          </div>
          <div id="collapse3" class="panel-collapse">
              <asp:RadioButtonList ID="rdProductType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse2">Tìm kiếm</a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse" style="padding:5px;">
          <asp:TextBox ID="txtCodeId" runat="server" CssClass="form-control" placeholder="Nhập mã vạch"></asp:TextBox><br />
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-usd"></i> Quản lý giá bán</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addProductPrice"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm sản phẩm</a>
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chuỗi</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã vạch</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã sản phẩm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên sản phẩm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Giá bán</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Từ ngày</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đến ngày</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1000px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Mã vạch</th>
                        <th class="bg-th">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                        <th class="bg-th right">Giá bán</th>
                        <th class="bg-th center">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Mã vạch</th>
                        <th class="bg-th">Mã sản phẩm</th>
                        <th class="bg-th">Tên sản phẩm</th>
                        <th class="bg-th right">Giá bán</th>
                        <th class="bg-th center">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
    
    <div class="modal fade" id="addProductPrice" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>THÊM GIÁ BÁN SẢN PHẨM</h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin đơn giá</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">Nhóm sản phẩm<br />
                            <select id="dlProductGroup" class="form-control select2" style="width: 100%;">
                            </select> 
                        </div>
                        <div class="col-md-4">Mã vạch sản phẩm<br />
                            <input type="text" id="txtProductCodeId" maxlength="20" class="enter form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Giá bán<br />
                            <input type="text" id="txtPrice" maxlength="10" class="enter input-price form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Từ ngày<br />
                            <input type="text" id="txtFromDate" class="enter input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Đến ngày<br />
                            <input type="text" id="txtToDate" class="enter input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 pull-right">
                            <span class=" btn-group"> <button type="button" class="btn btn-success" onclick="addPrice();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button></span>
                            &nbsp; <label> <input type="checkbox" id="ckLoad" checked="checked" /> Auto load</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addPrice" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>Thêm giá bán sản phẩm</h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin đơn giá</div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-4">Giá bán mới<br />
                            <input type="text" id="txtAddPrice" class="input-price form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Từ ngày<br />
                            <input type="text" id="txtAddFromDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Đến ngày<br />
                            <input type="text" id="txtAddToDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveAddChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="updatePrice" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>Cập nhật giá bán sản phẩm</h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin đơn giá</div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-4">Giá bán<br />
                            <input type="text" id="txtUpdatePrice" class="input-price form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Từ ngày<br />
                            <input type="text" id="txtUpdateFromDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Đến ngày<br />
                            <input type="text" id="txtUpdateToDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveUpdateChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdProductId" value="0" />
    <input type="hidden" id="hdIdPrice" value="0" />
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
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $(".enter").keypress(function (e) {
                if (e.which == 13) {
                    addPrice();
                    return false;
                }
            });

            $(".input-date").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 47 || e.which > 57)) {
                    return false;
                }
            });
            $(".input-price").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    if (e.which == 44) return true;
                    else return false;
                }
            });

            var table = $('#example2').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "pageLength": 20,
                "autoWidth": false,
                "order": [[1, 'asc']],
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copyHtml5',
                        text:'Copy',
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
                        copy: 'Copy danh sách',
                        print: 'In danh sách',
                        excel: 'Xuất Excel'
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
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/getPriceHistory',
                        data: '{"productId":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr id="remove'+data.d[i].Id+'">';
                                data_html += '<td class="pl">' + (i + 1).toString() + '</td>';
                                data_html += '<td id="pFromDate' + data.d[i].Id + '">' + data.d[i].FromDate + '</td>';
                                data_html += '<td id="pToDate' + data.d[i].Id + '">' + data.d[i].ToDate + '</td>';
                                data_html += '<td id="pPrice' + data.d[i].Id + '">' + data.d[i].Price + '</td>';
                                data_html += '<td id="pAction' + data.d[i].Id + '" style="text-align:right; padding:10px;">' +
                                    '<a href="#" onclick="addPrice_modal(' + data.d[i].ProductId + ')" class="btn btn-xs btn-success" data-toggle="modal" data-target="#addPrice" style="margin-right:10px;"><i class="glyphicon glyphicon glyphicon-plus-sign"></i> Thêm giá bán</a>' +
                                    '<a href="#" onclick="updatePrice_modal(' + data.d[i].Id + ',\'' + data.d[i].Price + '\',\'' + data.d[i].FromDate + '\',\'' + data.d[i].ToDate + '\')" class="btn btn-xs btn-warning" data-toggle="modal" data-target="#updatePrice" style="margin-right:10px;"><i class="glyphicon glyphicon glyphicon-refresh"></i> Cập nhật giá</a>' +
                                    '<a href="#" onclick="removePrice(' + data.d[i].Id + ')" class="btn btn-xs btn-warning" style="margin-right:10px;"><i class="glyphicon glyphicon glyphicon-trash"></i> Xóa đơn giá</a>' +
                                    '</td>';
                                data_html += '</tr>';

                            }
                            html = '<table id="tbdetail" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;width:100%;background-color:lavender;">' +
                                    '<tr>' +
                                        '<td class="bold pl" width="50px">STT</td>' +
                                        '<td class="bold">Từ ngày</td>' +
                                        '<td class="bold">Đến ngày</td>' +
                                        '<td class="bold">Giá bán</td>' +
                                        '<td class="bold" width="350px">Cập nhật</td>' +
                                    '</tr>' + data_html +
                                '</table>';
                            row.child(html).show();
                            tr.addClass('shown');
                        }
                    });
                }
            });
        });
    </script>
    <script>
        function addPrice_modal(x) {
            $("#addPrice").modal({ show: false });
            $('#hdProductId').val(x);
        }
        function updatePrice_modal(id, price, fromdate, todate) {
            $("#updatePrice").modal({ show: false });
            $('#txtUpdatePrice').val(price);
            $('#txtUpdateFromDate').val(fromdate);
            $('#txtUpdateToDate').val(todate);

            $('#hdIdPrice').val(id);
        }
        function removePrice(id) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/deletePriceProduct',
                    data: '{"idPrice":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('#remove' + id).remove();
                            $('.removeprice' + id).remove();
                            
                            showAlert('Xóa giá bán thành công');
                        }
                        else
                            showAlert('Có phát sinh lỗi khi xóa đơn giá, chi tiết: ' + data.d._mess);
                    }
                });
            }
        }
        function saveAddChanges() {
            var price = $('#txtAddPrice').val();
            var fromdate = $('#txtAddFromDate').val();
            var todate = $('#txtAddToDate').val();
            var proId = $('#hdProductId').val();

            if (price == '' || fromdate == '')
                showAlert('Nhập đơn giá và ngày bắt đầu');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/insertPriceProduct',
                    data: '{"productId":"' + proId + '","price":"' + price + '","fromdate":"' + fromdate + '","todate":"' + todate + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == "1") {
                            
                            var html = '';
                            html += '<tr><td>' + $('#tbdetail tr').length + '</td><td id="pFromDate' + data.d._id + '">' + fromdate + '</td><td id="pToDate' + data.d._id + '">' + todate + '</td><td id="pPrice' + data.d._id + '">' + price + '</td><td style="text-align:right; padding:10px;" id="pAction' + data.d._id + '"><a href="#" onclick="addPrice_modal(' + proId + ')" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addPrice" style="margin-right:10px;"><i class="glyphicon glyphicon glyphicon-plus-sign"></i> Thêm giá bán</a><a href="#" onclick="updatePrice_modal(' + data.d._id + ',\'' + price + '\',\'' + fromdate + '\',\'' + todate + '\')" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#updatePrice" style="margin-right:10px;"><i class="glyphicon glyphicon glyphicon-refresh"></i> Cập nhật giá</a></td></tr>';
                            $('#tbdetail').append(html);

                            showAlert('Thêm giá bán mới thành công');
                            $('#addPrice').modal('hide');
                        }
                        else
                            showAlert('Chưa thêm được giá bán, lỗi chi tiết: ' + data.d._mess);
                    }
                });
            }
        }
        function saveUpdateChanges() {
            var price = $('#txtUpdatePrice').val();
            var fromdate = $('#txtUpdateFromDate').val();
            var todate = $('#txtUpdateToDate').val();
            var Id = $('#hdIdPrice').val();

            if (price == '' || fromdate == '')
                showAlert('Nhập đơn giá và ngày bắt đầu');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updatePriceProduct',
                    data: '{"id":"' + Id + '","price":"' + price + '","fromdate":"' + fromdate + '","todate":"' + todate + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == "1") {
                            var pf = document.getElementById('pFromDate' + Id);
                            var pt = document.getElementById('pToDate' + Id);
                            var pp = document.getElementById('pPrice' + Id);
                            var pa = document.getElementById('pAction' + Id);
                            var action='';
                            action += '<a href="#" onclick="addPrice_modal(' + Id + ')" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addPrice" style="margin-right:10px;"><i class="glyphicon glyphicon glyphicon-plus-sign"></i> Thêm giá bán</a>' +
                            '<a href="#" onclick="updatePrice_modal(' + Id + ',\'' + price + '\',\'' + fromdate + '\',\'' + todate + '\')" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#updatePrice" style="margin-right:10px;"><i class="glyphicon glyphicon glyphicon-refresh"></i> Cập nhật giá</a>';
                            
                            pf.innerHTML = fromdate;
                            pt.innerHTML = todate;
                            pp.innerHTML = price;
                            pa.innerHTML = action;

                            showAlert('Cập nhật giá bán thành công');
                            $('#updatePrice').modal('hide');
                        }
                        else
                            showAlert('Chưa cập nhật được giá bán, lỗi chi tiết: ' + data.d._mess);
                    }
                });
            }
        }
        function addPrice() {
            var branchType = $('#dlBranchType').val();
            var proType = $('#dlProductGroup').val();
            var proCode = $('#txtProductCodeId').val();
            var price = $('#txtPrice').val();
            var fromDate = $('#txtFromDate').val();
            var toDate = $('#txtToDate').val();

            var checkbox = $('#ckLoad:checked').val();
            var ckload = checkbox == 'on' ? true : false;
            
            if (proType == '' && proCode == '')
                showAlert('Chọn nhóm sản phẩm hoặc nhập mã vạch sản phẩm');
            else
                if (price == '' || fromDate == '')
                showAlert('Nhập đơn giá và ngày bắt đầu');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/insertPriceProductCode',
                    data: '{"productCodeList":"' + proType + '","proCode":"' + proCode + '","price":"' + price + '","fromdate":"' + fromDate + '","todate":"' + toDate + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Thêm giá bán thành công');
                            if (ckload) {
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else {
                                $('#txtProductCodeId').val('');
                                $('#txtPrice').val('');
                                $('#txtFromDate').val('');
                                $('#txtToDate').val('');
                                $('#txtProductCodeId').focus();

                                $(".crop-loading").hide();
                                $("#addProduct").modal('hide');
                            }
                        }
                        else
                            showAlert('Có phát sinh lỗi khi lưu thông tin, chi tiết: ' + data.d._mess);
                    }
                });
            }
        }
        function changeType(id) {
            loadProductTypeCode(id);
        }
        function loadProductTypeCode(branchType) {
            $('#dlProductGroup').find('option').remove().end();
            var c2 = document.getElementById('dlProductGroup');
            var op = document.createElement('option');
            op.value = '';
            op.innerHTML = 'Chọn nhóm';
            c2.appendChild(op);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadProductTypeCode',
                data: '{"branchType":"' + branchType + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlProductGroup');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._mess;
                        opt.innerHTML = data.d[i]._content;
                        c1.appendChild(opt);
                    }
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getBranchType',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('dlBranchType');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                    loadProductTypeCode($('#dlBranchType').val());
                }
            });
        });
    </script>
</asp:Content>


<%@ Page Title="Quản lý đơn đặt hàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

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
        #tbdetail tr td,#tbdetailcombo tr td
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
        
        .show
        {
            display: block;
        }
        .format-input{ width:55px; height:25px; text-align:center;}
        .rdList { margin:5px; width:95%;}
        .rdList tr td { border-bottom:1px solid #ccc; padding:10px 0px;}
        .detail-rows:hover, #tbdetail tr:hover,#tbdetailcombo tr:hover {background-color: whitesmoke !important;}
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
              <asp:RadioButtonList ID="rdBranchType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
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
              <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control datepicker2" Width="100%"></asp:TextBox>
              </li>
              <li class="list-group-item"><label>Đến ngày</label>
                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control datepicker2" Width="100%"></asp:TextBox>
              </li>
            </ul>
           <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-bullhorn"></i> Danh sách đơn đặt hàng</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" />&nbsp;Chi nhánh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày đặt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số hóa đơn</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên khách hàng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Điện thoại</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" />&nbsp;Email</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Địa chỉ</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
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
                        <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày đặt</th>
                        <th class="bg-th">Số hóa đơn</th>
                        <th class="bg-th">Tên khách hàng</th>
                        <th class="bg-th">Điện thoại</th>
                        <th class="bg-th">Email</th>
                        <th class="bg-th">Địa chỉ</th>
                         <th class="bg-th">Ghi chú</th>
                         <th class="bg-th">Trạng thái</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày đặt</th>
                        <th class="bg-th">Số hóa đơn</th>
                        <th class="bg-th">Tên khách hàng</th>
                        <th class="bg-th">Điện thoại</th>
                        <th class="bg-th">Email</th>
                        <th class="bg-th">Địa chỉ</th>
                         <th class="bg-th">Ghi chú</th>
                         <th class="bg-th">Trạng thái</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<input type="hidden" id="hdOrderId" value="" />
    <input type="hidden" id="hdBranchTypeId" value="" />
<div class="modal fade" id="addProduct" role="dialog">
        <div class="modal-dialog  modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i><span id="lb">THÊM SẢN PHẨM</span> </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Mã vạch sản phẩm<br />
                            <input type="text" id="txtCode" class="numbers form-control proCode" maxlength="20" style="width: 100%;" />
                        </div>
                        <div class="col-md-6">
                            Tên sản phẩm<br />
                            <input type="text" id="txtName" disabled="disabled" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-2">Số lượng<br />
                            <input type="text" id="txtQuantity" class="input-price form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success btnSave" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var options = ["2","3","4","5","7","8","9"];

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
                "pageLength": 25,
                "autoWidth": false,
                "order": [[1, 'asc']],
                dom: 'Bfrtip',
                "columnDefs": [
                  {
                      "targets": [6, 1],
                      "visible": false,
                      "searchable": false
                  }],
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
                        text:'Print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
			        {
			            extend: 'excelHtml5',
                        text:'Export',
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
                        url: '/Command.aspx/getOrderDetail',
                        data: '{"orderId":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr id="od' + data.d[i].Id + '">';
                                data_html += '<td>' + (i + 1).toString() + '</td>';
                                data_html += '<td>' + data.d[i].CodeId + '</td>';
                                data_html += '<td>' + data.d[i].ProCode + '</td>';
                                data_html += '<td>' + data.d[i].ProName + '</td>';
                                data_html += '<td><input type="text" maxlength="5" class="format-input numbers" id="order_quantity' + data.d[i].Id + '" value="' + data.d[i].Quantity + '" /></td>';
                                data_html += '<td>' + data.d[i].Price + '</td>';
                                if (data.d[i].Status == '1') {
                                    data_html += '<td><a href="#" title = "Cập nhật số lượng sản phẩm" onclick="return updateQuantity(' + data.d[i].Id + ');" class="btn btn-xs btn-success">Cập nhật</a>';
                                    data_html += '<a href="#" title = "Thêm sản phẩm mới" style="margin-left:10px;" onclick="return addProduct(' + id + ',' + data.d[i].BranchType + ');"  data-toggle="modal" data-target="#addProduct" class="btn btn-xs btn-success">Thêm sản phẩm</a>';
                                    data_html += '<a href="#" title="Xóa sản phẩm này" style="margin-left:10px;" onclick="return removeProduct(' + data.d[i].Id + ',' + data.d[i].ProductId + ');" class="btn btn-xs btn-danger">Xóa sản phẩm</a></td>';
                                }
                                else {
                                    data_html += '<td>&nbsp;</td>';
                                }
                                data_html += '</tr>';
                            }
                            if (data.d[0].Status == '1') {
                                data_html += '<tr>';
                                data_html += '<td colspan="7" style="padding:5px;">';
                                data_html += '<a href="#" onclick="return AcceptOrder(' + id + ');"  class="btn btn-sm btn-success btnaccept" style="margin-right:10px;">Xác nhận đơn hàng</a>';
                                data_html += '<a href="#" onclick="return CancelOrder(' + id + ');"  class="btn btn-sm btn-danger btncancel">Hủy đơn hàng</a>';
                                data_html += '</td></tr>';
                            }
                            html = '<table id="tbdetailcombo" cellpadding="5" cellspacing="5" border="0" style="padding:50px; width:92%; margin-left:75px;">' +
                                    '<tr>' +
                                        '<td class="bold" width="50px">STT</td>' +
                                        '<td class="bold">Mã vạch</td>' +
                                        '<td class="bold">Mã sản phẩm</td>' +
                                        '<td class="bold">Tên sản phẩm</td>' +
                                        '<td class="bold">Số lượng</td>' +
                                        '<td class="bold">Đơn giá</td>' +
                                        '<td class="bold">Cập nhật</td>' +
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
    <script type="text/javascript">
        $(document).ready(function () {
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $(".proCode").keypress(function (e) {
                if (e.which == 13) {
                    detailProduct();
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
        });
    </script>
    <script type="text/javascript">
        function AcceptOrder(orderId) {
            if (confirm("Bạn chắc chắn muốn xác nhận đơn hàng này ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/acceptOrder',
                    data: '{"orderId":"' + orderId + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._id == '1') {
                            showAlert(data.d._mess);
                            $('.btnaccept').hide();
                            $('.btncancel').hide();

                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function CancelOrder(orderId) {
            if (confirm("Bạn chắc chắn muốn hủy đơn hàng này ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/CancelOrder',
                    data: '{"orderId":"' + orderId + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._id == '1') {
                            showAlert(data.d._mess);
                            $('.btnaccept').hide();
                            $('.btncancel').hide();
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function updateQuantity(Id) {
            if (confirm("Bạn chắc chắn muốn cập nhật số lượng ?") == true) {
                var quantity = $('#order_quantity' + Id).val();
                if (quantity == '') showAlert('Nhập số lượng sản phẩm');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateQuantityOrder',
                        data: '{"Id":"' + Id + '","quantity":"' + quantity + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._id == '1') {
                                showAlert(data.d._mess);
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
            }
            return false;
        }
        function addProduct(orderId, branchType) {
            $('#hdOrderId').val(orderId);
            $('#hdBranchTypeId').val(branchType);

            $('#txtCode').val('');
            $('#txtName').val('');
            $('#txtQuantity').val('1');
            $("#addProduct").modal({ show: false });
            return false;
        }
        function removeProduct(orderId, proId) {
            if (confirm("Bạn chắc chắn muốn xóa sản phẩm này ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/removeProductOrder',
                    data: '{"orderId":"' + orderId + '","proId":"' + proId + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._id == '1') {
                            showAlert(data.d._mess);
                            $('#od' + orderId).remove();
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function saveChanges() {
            var orderId = $('#hdOrderId').val();
            var branchtype = $('#hdBranchTypeId').val();
            var codeid = $('#txtCode').val();
            var quantity = $('#txtQuantity').val();
            if (codeid == '' || quantity == '') showAlert('Nhập mã vạch và số lượng sản phẩm');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/addProductOrder',
                    data: '{"orderId":"' + orderId + '","codeId":"' + codeid + '","branchType":"' + branchtype + '","quantity":"' + quantity + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._id == '1') {
                            showAlert(data.d._mess);
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
        }
        function detailProduct() {
            var branchtype = $('#hdBranchTypeId').val();
            var codeid = $('#txtCode').val();

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getDetailProduct',
                data: '{"branchTypeId":"' + branchtype + '","codeId":"' + codeid + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d.OK == '1') {
                        $('#txtName').val(data.d.ProductName + ' - ' + data.d.Price);
                    }
                    else {
                        $('#txtName').val('');
                        showAlert('Không tìm thấy sản phẩm có mã ' + codeid + '. Kiểm tra lại');
                    }
                }
            });
        }
    </script>
</asp:Content>




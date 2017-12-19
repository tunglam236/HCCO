<%@ Page Title="Quản lý mã giảm giá" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Discount.aspx.cs" Inherits="Discount" %>

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
          <div id="collapse3" class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdBranchType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
     
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-bullhorn"></i> Quản lý Voucher giảm giá</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" class="btn btn-sm btn-success" onclick="showModal();" data-toggle="modal" data-target="#addDiscount"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm Voucher</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên chương trình</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Loại giảm giá</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số lượng mã</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Giá trị giảm giá</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Giá trị đơn hàng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Từ ngày</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đến ngày</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người tạo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày tạo</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1050px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Tên chương trình</th>
                        <th class="bg-th">Loại giảm giá</th>
                        <th class="bg-th">Số lượng mã</th>
                        <th class="bg-th">Giá trị giảm giá</th>
                        <th class="bg-th">Giá trị đơn hàng</th>
                        <th class="bg-th">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                         <th class="bg-th">Người tạo</th>
                         <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Tên chương trình</th>
                        <th class="bg-th">Loại giảm giá</th>
                        <th class="bg-th">Số lượng mã</th>
                        <th class="bg-th">Giá trị giảm giá</th>
                        <th class="bg-th">Giá trị đơn hàng</th>
                        <th class="bg-th">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                        <th class="bg-th">Người tạo</th>
                        <th class="bg-th">Ngày tạo</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<input type="hidden" id="hdId" value="" />
<div class="modal fade" id="addDiscount" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i><span id="lb">THÊM VOUCHER GIẢM GIÁ</span> </h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin Voucher</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-3">
                            Tên chương trình<br />
                            <input type="text" id="txtDiscountName" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Loại giảm giá<br />
                            <select id="dlDiscountType" class="form-control select2" style="width: 100%;">
                                <option value="1" selected="selected">Giảm giá tiền</option>
                                <option value="2">Giảm giá phần trăm</option>
                            </select>
                        </div>
                         <div class="col-md-3">Số lượng mã<br />
                            <input type="text" id="txtDiscountNumber" class="input-price form-control" style="width: 100%;" />
                        </div>
                    </div>
                    
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">Giá trị giảm giá<br />
                            <input type="text" id="txtTotalPrice" class="input-price form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">Giá trị đơn hàng<br />
                            <input type="text" id="txtMinOrder" class="input-price form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">Từ ngày<br />
                            <input type="text" id="txtFromDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">Đến ngày<br />
                            <input type="text" id="txtToDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                    </div>
                    
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success btnSave" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success btnUpdate" onclick="updateChanges();">
                                Cập nhật</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var options = ["1","2","3","4","5","6","7"];

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
                    "targets": [8, 9],
                    "visible": false,
                    "searchable": false
                 }],
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
                        url: '/Command.aspx/loadDiscountList',
                        data: '{"discountId":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr>';
                                data_html += '<td>' + (i + 1).toString() + '</td>';
                                data_html += '<td>' + data.d[i]._content + '</td>';
                                data_html += '<td>' + data.d[i]._mess + '</td>';
                                data_html += '<td><a href="#" onclick="return showUpdate(' + data.d[i]._id + ');" data-toggle="modal" data-target="#addDiscount" class="btn btn-xs btn-success">Cập nhật</a></td>';
                                data_html += '</tr>';

                            }
                            html = '<table id="tbdetailcombo" cellpadding="5" cellspacing="5" border="0" style="padding:50px; width:92%; margin-left:75px;">' +
                                    '<tr>' +
                                        '<td class="bold" width="50px">STT</td>' +
                                        '<td class="bold">Mã giảm giá</td>' +
                                        '<td class="bold">Trạng thái</td>' +
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
                    addProduct();
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
                }
            });
        });
    </script>
    <script type="text/javascript">
        function saveChanges() {
            var branchTypeId = $('#dlBranchType').val();
            var type = $('#dlDiscountType').val();
            var name = $('#txtDiscountName').val();
            var numbers = $('#txtDiscountNumber').val();
            var price = $('#txtTotalPrice').val();
            var fromdate = $('#txtFromDate').val();
            var todate = $('#txtToDate').val();
            var minorder = $('#txtMinOrder').val();
            
            if (name == '') showAlert('Nhập tên chương trình Voucher');
            else if (numbers == '') showAlert('Nhập số lượng mã Voucher');
            else if (price == '') showAlert('Nhập tổng tiền');
            else if (minorder == '') showAlert('Nhập giá trị đơn hàng tối thiểu');
            else if (fromdate == '') showAlert('Nhập thời gian áp dụng');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/insertDiscount',
                    data: '{"branchType":"' + branchTypeId + '","name":"' + name + '","type":"' + type + '","number":"' + numbers + '","values":"' + price + '","fromdate":"' + fromdate + '","todate":"' + todate + '","minorder":"' + minorder + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Lưu Voucher thành công.' + data.d._mess);

                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert('Có lỗi khi lưu Voucher, chi tiết: ' + data.d._mess);
                    }
                });
            }
        }
        function showModal() {
            $('#hdId').val('');
            $('.btnSave').show();
            $('.btnUpdate').hide();
            $('#lb').text('THÊM VOUCHER GIẢM GIÁ');

            $('#txtDiscountName').val('');
            $('#txtDiscountNumber').val('');
            $('#txtTotalPrice').val('');
            $('#txtFromDate').val('');
            $('#txtToDate').val('');
            $('#txtMinOrder').val('');

            $("#addDiscount").modal({ show: false });
        }
        function showUpdate(id)
        {
            $('#hdId').val(id);
            $('.btnSave').hide();
            $('.btnUpdate').show();
            $('#lb').text('CẬP NHẬT VOUCHER');
           
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getDiscount',
                data: '{"id":"' + $('#hdId').val() + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d.OK == '1') {
                        $('#dlBranchType').val(data.d.BranchType);
                        $('#select2-dlBranchType-container').text($('#dlBranchType option:selected').text());

                        $('#dlDiscountType').val(data.d.Type);
                        $('#select2-dlDiscountType-container').text($('#dlDiscountType option:selected').text());

                        $('#txtDiscountName').val(data.d.Name);
                        $('#txtDiscountNumber').val(data.d.Number);
                        $('#txtTotalPrice').val(data.d.Value);
                        $('#txtFromDate').val(data.d.FromDate);
                        $('#txtToDate').val(data.d.ToDate);
                        $('#txtMinOrder').val(data.d.MinOrder);

                        $("#addDiscount").modal({ show: false });
                    }
                    else
                        showAlert(data.d.Mess);
                }
            });
            return false;
        }
        function updateChanges() {
            var Id = $('#hdId').val();
            var branchTypeId = $('#dlBranchType').val();
            var type = $('#dlDiscountType').val();
            var name = $('#txtDiscountName').val();
            var numbers = $('#txtDiscountNumber').val();
            var price = $('#txtTotalPrice').val();
            var fromdate = $('#txtFromDate').val();
            var todate = $('#txtToDate').val();
            var minorder = $('#txtMinOrder').val();

            if (name == '') showAlert('Nhập tên chương trình Voucher');
            else if (numbers == '') showAlert('Nhập số lượng mã Voucher');
            else if (price == '') showAlert('Nhập tổng tiền');
            else if (minorder == '') showAlert('Nhập giá trị đơn hàng tối thiểu');
            else if (fromdate == '') showAlert('Nhập thời gian áp dụng');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateDiscount',
                    data: '{"id":"'+Id+'","branchType":"' + branchTypeId + '","name":"' + name + '","type":"' + type + '","number":"' + numbers + '","values":"' + price + '","fromdate":"' + fromdate + '","todate":"' + todate + '","minorder":"' + minorder + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Cập nhật Voucher thành công.' + data.d._mess);

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
    </script>
</asp:Content>


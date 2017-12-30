<%@ Page Title="Danh sách xuất hàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="OutputStock.aspx.cs" Inherits="OutputStock" %>

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
        
        .show
        {
            display: block;
        }
        .rdList { margin:5px; width:95%;}
        .rdList tr td { border-bottom:1px solid #ccc; padding:10px 0px;}
        .detail-rows:hover {background-color: #27ae6078 !important;}
        .format-input{ width:55px; height:25px; text-align:center;}
         table#example2 tbody tr.selected { background-color:#27ae6078;}
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
              <a data-toggle="collapse" href="#collapse1">Thời gian</a>
            </h4>
          </div>
          <div id="collapse1" class="panel-collapse">
            <ul class="list-group">
              <li class="list-group-item"><label>Từ ngày</label>
              <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control datepicker2" Width="99%"></asp:TextBox>
              </li>
              <li class="list-group-item"><label>Đến ngày</label>
                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control datepicker2" Width="99%"></asp:TextBox>
              </li>
            </ul>
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
              <a data-toggle="collapse" href="#collapse2">Loại phiếu xuất</a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse" style="padding:5px;">
          <asp:RadioButtonList ID="rdOutputType" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                <asp:ListItem Value="" Selected="True"> Tất cả</asp:ListItem>
                <asp:ListItem Value="1"> Xuất bán</asp:ListItem>
                <asp:ListItem Value="2"> Xuất điều chuyển</asp:ListItem>
              </asp:RadioButtonList>
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-shopping-cart"></i> Danh sách xuất hàng</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addStock"><i class="glyphicon glyphicon glyphicon-share"></i> Xuất điều chuyển</a>
      <div class="dropdown">
      <button class="btn btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số hóa đơn</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Loại phiếu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox"/>&nbsp;Đối tượng xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox"/>&nbsp;Đối tượng nhận</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tổng tiền</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;% CK</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;TT Chiết khấu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thành tiền</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ghi chú</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Thanh toán</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="12" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người xuất</label> </a></li>
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
                        <th class='bg-th center' width="60px"></th>
                        <th class="bg-th">Số hóa đơn</th>
                        <th class="bg-th">Loại phiếu</th>
                        <th class="bg-th">Đối tượng xuất</th>
                        <th class="bg-th">Đối tượng nhận</th>
                        <th class="bg-th right" width="100px">Tổng hóa đơn</th>
                        <th class="bg-th right" width="40px"> % CK</th>
                         <th class="bg-th right" width="100px">TT Chiết khấu</th>
                        <th class="bg-th right" width="80px">Thành tiền</th>
                        <th class="bg-th">Ghi chú</th>
                        <th class="bg-th">Thanh toán</th>
                        <th class="bg-th center" width="80px">Ngày xuất</th>
                        <th class="bg-th" width="80px">Người xuất</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="60px"></th>
                        <th class="bg-th">Số hóa đơn</th>
                        <th class="bg-th">Loại phiếu</th>
                        <th class="bg-th">Đối tượng xuất</th>
                        <th class="bg-th">Đối tượng nhận</th>
                       <th class="bg-th right">Tổng hóa đơn</th>
                        <th class="bg-th right"> % CK</th>
                         <th class="bg-th right">TT Chiết khấu</th>
                        <th class="bg-th right">Thành tiền</th>
                        <th class="bg-th">Ghi chú</th>
                        <th class="bg-th">Thanh toán</th>
                        <th class="bg-th center">Ngày xuất</th>
                        <th class="bg-th">Người xuất</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="modal fade" id="addStock" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>XUẤT ĐIỀU CHUYỂN CHI NHÁNH</h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin xuất hàng</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Chi nhánh xuất<br />
                            <select id="dlBranch" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                           Chi nhánh nhận<br />
                            <select id="dlToBranch" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            Ghi chú<br />
                            <input type="text" id="txtNote" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết xuất hàng</div>
                    <div class="row" style="padding: 5px;">
                        <%--<div class="col-md-8">
                            Mã vạch sản phẩm<br />
                            <input type="text" id="productCode" class="proCode form-control" style="width: 100%;" />
                        </div>--%>
                        <div class="col-md-10">
                            Tìm kiếm sản phẩm<br />
                            <select id="dlProduct" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-2">
                            Số lượng<br />
                            <input type="text" id="quantity" class="proCode numbers form-control" style="width: 100%;" />
                        </div>
                        <%--<div class="col-md-2">
                            <br />
                            <a href="#" data-toggle="modal" data-target="#inputQuick" class="" style="color:white;">Nhập nhanh</a>
                        </div>--%>
                    </div>
                    <div class="row" style="padding: 5px;max-height: 200px;overflow-y: scroll;">
                        <table id="tbdetail" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 500px;
                            margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th>
                                        Xóa
                                    </th>
                                    <th>
                                        Mã vạch
                                    </th>
                                    <th>
                                        Mã sản phẩm
                                    </th>
                                    <th>
                                        Tên sản phẩm
                                    </th>
                                    <th>
                                        Số lượng
                                    </th>
                                    
                                </tr>
                            </thead>
                            <tbody id="data-detail">
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success" onclick="addProduct();">
                                Thêm sản phẩm</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="inputQuick" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-spinner" aria-hidden="true"></i> NHẬP NHANH SẢN PHẨM</h4>
                </div>
                <div class="modal-body">
                    <i>Copy dữ liệu từ file Excel tương ứng với các cột bên dưới và dán vào đây</i>
                    <div class="row" style="padding: 5px;">
                        <table cellpadding="5" cellspacing="5" border="0" width="80%" margin-left: 15px;">
                            <tr>
                                <th>
                                    Mã vạch
                                </th>
                                 <th>
                                    Mã sản phẩm  -  Tên sản phẩm  -  Số lượng
                                </th>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <textarea id="txtquick" rows="5" cols="90"></textarea>
                                </td>

                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12 btn-group" style="padding-left: 5px;">
                            <button type="button" class="btn btn-success" onclick="getQuick();">Import</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <img class="crop-loading" src="dist/img/crop.gif" style="display:none;position:fixed; top:50%; left:50%" />
    <script>
        var options = ["1", "2", "5", "6", "7", "8","11"];

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
                "order": [[1, 'desc']],
                "columnDefs": [
                {
                    "targets": [3,4,9,10],
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
                        copy: 'Copy danh sách',
                        print: 'In danh sách',
                        excel: 'Xuất Excel'
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

            $('#example2 tbody').on('click', 'tr .showchild', function () {
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
                        url: '/Command.aspx/getdetail',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr>';
                                data_html += '<td>' + (i + 1).toString() + '</td>';
                                data_html += '<td>' + data.d[i].ProductCode + '</td>';
                                data_html += '<td>' + data.d[i].ProductName + '</td>';
                                data_html += '<td>' + data.d[i].Quantity + '</td>';
                                data_html += '<td>' + data.d[i].Price + '</td>';
                                data_html += '<td>' + data.d[i].DiscountPercent + '</td>';
                                data_html += '<td>' + data.d[i].Discount + '</td>';
                                data_html += '<td>' + data.d[i].Total + '</td>';
                                data_html += '</tr>';

                            }
                            html = '<table id="tbdetail" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;width:95%; margin-left:25px;">' +
                                    '<tr>' +
                                        '<td class="bold" width="30px">STT</td>' +
                                        '<td class="bold">Mã sản phẩm</td>' +
                                        '<td class="bold">Tên sản phẩm</td>' +
                                        '<td class="bold">Số lượng</td>' +
                                        '<td class="bold">Đơn giá</td>' +
                                        '<td class="bold">% CK</td>' +
                                        '<td class="bold">TT Chiết khấu</td>' +
                                        '<td class="bold">Thành tiền</td>' +
                                    '</tr>' + data_html +
                                '</table>';


                            row.child(html).show();
                            tr.addClass('shown');
                            $('.crop-loading').hide();
                        }
                    });
                }
            });
            $(".select2").select2();
        });
    </script>
    <script type="text/javascript">
        function removeproduct(index, name) {
            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                var id = '#rows' + index;
                $(id).remove();
                showAlert('Đã xóa sản phẩm [' + name + ']');
            }
            return false;
        }
        function addProduct() {
            //var code = $('#productCode').val();
            var pro_id = $('#dlProduct').val();
            var pro_name = $('#dlProduct option:selected').text()

            var quantity = $('#quantity').val();
            if (quantity == '') quantity = '1';
            if (pro_id != '') {
                var ok = true;
                $("#data-detail tr").each(function () {
                    var _id = $(this).attr("data-code");
                    if (_id == pro_id) ok = false;
                });
                if (ok) {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/getDetailProductBySearch',
                        data: '{"branchTypeId":"' + $('#dlBranchType').val() + '","Id":"' + pro_id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d.OK == '1') {
                                var html = "";
                                html += "<tr class='output-detail-rows' id='rows" + data.d.Id + "' data-code='" + data.d.Id + "'>" +
                                            "<td>" +
                                                "<a onclick='removeproduct(" + data.d.Id + ",\"" + data.d.ProductName + "\");'><i class='fa fa-trash-o' aria-hidden='true'></i></a>" +
                                            "</td>" +
                                            "<td>" + data.d.CodeId + "</td>" +
                                            "<td>" + data.d.ProductCode + "</td>" +
                                            "<td>" + data.d.ProductName + "</td>" +
                                            "<td><input type='text' class='format-input' id='quantity" + data.d.Id + "' value='" + quantity + "' /></td>" +
                                        '</tr>';

                                $('#data-detail').append(html);
                                //$('#productCode').val('');
                                //$('#productCode').focus();
                                $('#quantity').val('1');
                            }
                            else
                                showAlert('Không tìm thấy sản phẩm có mã ' + code + '. Kiểm tra lại');
                        }
                    });
                }
                else
                    showAlert('Đã tồn tại sản phẩm ' + pro_name + ', hãy kiểm tra lại');
            }
            else showAlert('Nhập mã vạch sản phẩm');
            return false;
        }
        function saveChanges() {
            var branchTypeId = $('#dlBranchType').val();
            var branchId = $('#dlBranch').val();
            var branchTo = $('#dlToBranch').val();
            var note = $('#txtNote').val();
            var data = "";

            $(".output-detail-rows").each(function () {
                var id = $(this).attr("data-code");
                var quantity = $("#quantity" + id).val();
                if (data != "") data += "#";
                data += id + "," + quantity;
            });
            
            if (branchTypeId == "") showAlert('Chọn chuỗi');
            else if (branchId == "") showAlert('Chọn chi nhánh');
            else if (branchId == branchTo) showAlert('Chi nhánh nhận phải khác chi nhánh xuất');
            else if (data == "") showAlert('Chưa có dữ liệu nào để lưu');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/insertStockOutput',
                    data: '{"branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","tobranchId":"' + branchTo + '","note":"' + note + '","totalPrice":"0","data":"' + data + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('.output-detail-rows').remove();
                            $('#txtNote').val('');
                            //$('#productCode').val('');
                            //$('#productCode').focus();
                            $('#quantity').val('1');
                            showAlert('Lưu phiếu xuất thành công');

                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert('Có lỗi khi lưu phiếu xuất, chi tiết: ' + data.d._mess);
                    }
                });
            }
        }
        function getQuick() {
            $('#data-detail tr').remove();
            var q = $('#txtquick').val();
            var line = q.split('\n');
            for (var t = 0; t < line.length; t++) {
                if (line[t] != '') {
                    var sp = line[t].split('	');
                    var html = "";
                    html += "<tr class='output-detail-rows' id='rows" + sp[0].substring(2, sp[0].length) + "' data-code='" + sp[0].substring(2, sp[0].length) + "'>" +
                                "<td>" +
                                    "<a onclick='removeproduct(" + sp[0].substring(2, sp[0].length) + ",\"" + sp[2] + "\");'><i class='fa fa-trash-o' aria-hidden='true'></i></a>" +
                                "</td>" +
                                "<td>" + sp[0] + "</td>" +
                                "<td>" + sp[1] + "</td>" +
                                "<td>" + sp[2] + "</td>" +
                                "<td><input type='text' class='format-input numbers' id='quantity" + sp[0].substring(2, sp[0].length) + "' value='" + sp[3] + "' /></td>" +
                            '</tr>';
                    $('#data-detail').append(html);
                }
            }
            //$('#productCode').val('');
            //$('#productCode').focus();
            $('#quantity').val('1');
            $('#inputQuick').modal('hide');
        }
    </script>
    <script>
        function changeType(id) {
            loadBranchbyType(id);
        }

        function loadBranchbyType(id) {
            $('#dlBranch').find('option').remove().end();
            $('#dlToBranch').find('option').remove().end();
            $('#dlProduct').find('option').remove().end();

            var c1 = document.getElementById('dlBranch');
            var c2 = document.getElementById('dlToBranch');

            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn chi nhánh';
            c1.appendChild(opt_);

            var opto_ = document.createElement('option');
            opto_.value = '';
            opto_.innerHTML = 'Chọn chi nhánh';
            c2.appendChild(opto_);

            
            var c3 = document.getElementById('dlProduct');
            var opt3_ = document.createElement('option');
            opt3_.value = '';
            opt3_.innerHTML = 'Chọn sản phẩm';
            c3.appendChild(opt3_);

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

                            var opt2 = document.createElement('option');
                            opt2.value = data.d[i]._content;
                            opt2.innerHTML = data.d[i]._mess;
                            c2.appendChild(opt2);
                        }
                    }
                });

                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/loadProductByBranchType',
                    data: '{"branchType":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i]._id;
                            opt.innerHTML = data.d[i]._content;
                            c3.appendChild(opt);
                        }
                    }
                });
            }
        }
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
                    return false;
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
                    var opt_ = document.createElement('option');
                    opt_.value = '';
                    opt_.innerHTML = 'Chọn chuỗi';
                    c1.appendChild(opt_);

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
    </script>
</asp:Content>


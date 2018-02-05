<%@ Page Title="Quản lý thông tin khuyến mại, giờ vàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Sale.aspx.cs" Inherits="Sale" %>

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
              <asp:RadioButtonList ID="rdBranchType" AutoPostBack="true" OnSelectedIndexChanged="rdBranchType_SelectedIndexChanged" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse2">Chi nhánh</a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse" style="padding:5px;">
          <asp:RadioButtonList ID="rdBranch" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
      <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-gift"></i> Chương trình khuyến mại, giờ vàng</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addCombo"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm chương trình</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chuỗi</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chi nhánh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên chương trình</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" />&nbsp;Mô tả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Từ ngày</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đến ngày</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Hình thức KM</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Giá trị KM</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" />&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày tạo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người tạo</label> </a></li>
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
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Tên chương trình</th>
                        <th class="bg-th">Mô tả</th>
                         <th class="bg-th">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                         <th class="bg-th">Hình thức KM</th>
                        <th class="bg-th">Giá trị KM</th>
                        <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Ngày tạo</th>
                        <th class="bg-th">Người tạo</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px"></th>
                        <th class="bg-th">Chuỗi</th>
                        <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Tên chương trình</th>
                         <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                         <th class="bg-th">Hình thức KM</th>
                        <th class="bg-th">Giá trị KM</th>
                         <th class="bg-th">Trạng thái</th>
                        <th class="bg-th">Ngày tạo</th>
                        <th class="bg-th">Người tạo</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<input type="hidden" id="hdGiftId" value="0" />
<div class="modal fade" id="addCombo" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>THÊM CHƯƠNG TRÌNH KHUYẾN MẠI</h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin chương trình</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Chi nhánh<br />
                            <select id="dlBranch" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Tên chương trình<br />
                            <input type="text" id="txtName" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Loại khuyến mại<br />
                            <select id="dlTypeSale" class="form-control select2" style="width: 100%;">
                                <option value="1" selected="selected">Giảm giá tiền</option>
                                <option value="2">Giảm giá phần trăm</option>
                                <option value="3">Đồng giá</option>
                                <option value="4">Tùy chỉnh giá</option>
                            </select>
                        </div>
                        <div class="col-md-2">Giá trị khuyến mại<br />
                            <input type="text" id="txtTotalPrice" class="input-price form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-2">Độ ưu tiên<br />
                            <select id="dlPriority" class="form-control select2" style="width: 100%;">
                                <option value="1" selected="selected">Bình thường</option>
                                <option value="2">Ưu tiên cấp 1</option>
                                <option value="3">Ưu tiên cấp 2</option>
                                <option value="4">Ưu tiên cấp 3</option>
                            </select>
                        </div>
                       <div class="col-md-4">Mô tả chương trình<br />
                            <input type="text" id="txtDescription" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">Giờ bắt đầu<br />
                            <input type="text" id="txtFromHour" class="form-control timepicker" maxlength="10" style="width: 100%;" />
                        </div> 
                        <div class="col-md-3">Từ ngày<br />
                             <input type="text" id="txtFromDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">Giờ kết thúc<br />
                            <input type="text" id="txtToHour" class="form-control timepicker" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">Đến ngày<br />
                            <input type="text" id="txtToDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                    </div>
                     <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết sản phẩm khuyến mại</div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-3">
                            Mã vạch sản phẩm<br />
                            <input type="text" id="productCode" class="form-control proCode" maxlength="20" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Giá khuyến mại<br />
                            <input type="text" id="txtPrice" class="numbers form-control proCode" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Trạng thái<br />
                        <select id="dlStatus" class="form-control select2" style="width: 100%;">
                                <option value="1" selected="selected">Áp dụng</option>
                                <option value="2">Ngưng áp dụng</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <br />
                            <a href="#" data-toggle="modal" data-target="#inputQuick" id="btnad" class="btn btn-primary">Nhập nhanh</a>
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;max-width:100%; max-height:180px; overflow-x:auto; overflow-y:auto;">
                        <table id="tbdetail" cellpadding="5" cellspacing="5" border="0" width="98%" class="table-bordered" style="min-width: 500px;
                            margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th>
                                        STT
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
                                        Đơn giá
                                    </th>
                                    <th>
                                        Xóa
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
    <input type="hidden" id="hdBranchType" value="" />
<div class="modal fade" id="addProductToGift" role="dialog">
        <div class="modal-dialog  modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>Thêm sản phẩm vào chương trình</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            Mã vạch sản phẩm<br />
                            <input type="text" id="ins_productCode" class="form-control" maxlength="20" style="width: 100%;" />
                        </div>
                        <div class="col-md-6">
                            Đơn giá khuyến mại<br />
                            <input type="text" id="ins_price" class="form-control" maxlength="20" style="width: 100%;" />
                        </div>
                    </div>
                     
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="ins_saveChanges();">
                                Lưu lại</button>
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
                        <table cellpadding="5" cellspacing="5" border="0" width="100%" margin-left: 15px;">
                            <tr>
                                <th>
                                    Mã vạch | Giá khuyến mại
                                </th>
                                 
                            </tr>
                            <tr>
                                <td>
                                    <textarea id="txtquick" rows="5" style="width:100%;"></textarea>
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
    <script>
        var options = ["1","2","3","5","6","7","8"];

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
                "columnDefs": [
                {
                    "targets": [4,9,10,11],
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
                        url: '/Command.aspx/getGiftDetail',
                        data: '{"saleId":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr id="remove-combo' + data.d[i].Id + '-' + data.d[i].ProductId + '">';
                                data_html += '<td>' + (i + 1).toString() + '</td>';
                                data_html += '<td>' + data.d[i].CodeId + '</td>';
                                data_html += '<td>' + data.d[i].ProCode + '</td>';
                                data_html += '<td>' + data.d[i].ProName + '</td>';
                                data_html += '<td>' + data.d[i].Price + '</td>';
                                data_html += '<td>';
                                data_html += '<a href="#" title="Thêm sản phẩm vào chương trình" onclick="showmodal(' + data.d[i].Id + ')" data-toggle="modal" data-target="#addProductToGift" class="btn btn-sm btn-success" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-plus-sign"></i></a>';
                                data_html += '<a href="#" title="Xóa sản phẩm" onclick="return removeDetailCombo(' + data.d[i].Id + ',' + data.d[i].ProductId + ');" class="btn btn-sm btn-danger" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-remove-circle"></i></a>';
                                data_html += '<a href="#" title="Chỉnh sửa chương trình" onclick="return editDetailCombo(' + data.d[i].Id + ');" class="btn btn-sm btn-warning" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-edit"></i></a>';
                                data_html += '</td></tr>';

                            }
                            html = '<table id="tbdetailcombo" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;width:95%; margin-left:25px;">' +
                                    '<tr>' +
                                        '<td class="bold" width="50px">STT</td>' +
                                        '<td class="bold">Mã vạch</td>' +
                                        '<td class="bold">Mã sản phẩm</td>' +
                                        '<td class="bold">Tên sản phẩm</td>' +
                                        '<td class="bold">Giá khuyến mại</td>' +
                                        '<td class="bold" width="190px">Cập nhật</td>' +
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
         function changeType(id) {
             loadDrop(id);
         }
         function loadDrop(branchTypeId) {
             $('#dlBranch').find('option').remove().end();
             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/getBranchByType',
                 data: '{"typeId":"' + branchTypeId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     var c1 = document.getElementById('dlBranch');
                     for (var i = 0; i < data.d.length; i++) {
                         var opt = document.createElement('option');
                         opt.value = data.d[i]._content;
                         opt.innerHTML = data.d[i]._mess;
                         c1.appendChild(opt);
                     }
                 }
             });
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
                }
            });
            $("#ins_productCode").keypress(function (e) {
                if (e.which == 13) {
                    ins_saveChanges();
                }
            });
            $("#ins_price").keypress(function (e) {
                if (e.which == 13) {
                    ins_saveChanges();
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
                    loadDrop($('#dlBranchType').val());
                }
            });
        });
    </script>
    <script type="text/javascript">
        function removeproduct(index, name) {
            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                var id = '#remove-' + index;
                $(id).remove();
                showAlert('Đã xóa sản phẩm [' + name + ']');
            }
            return false;
        }
        function showmodal(idCombo) {
            $("#addProductToGift").modal({ show: false });
            $('#hdGiftId').val(idCombo);
            $('#ins_productCode').val('');
        }
        function ins_saveChanges() {
            var proCode = $('#ins_productCode').val();
            var proPrice = $('#ins_price').val();

            if (proCode == '' || proPrice=='')
                showAlert('Nhập mã vạch sản phẩm và đơn giá');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/insertProductGift',
                    data: '{"idSale":"' + $('#hdGiftId').val() + '","productCode":"' + proCode + '","price":"'+proPrice+'"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {

                            //var arr = data.d._mess;
                            //var d_id = data.d._id;
                            //var indexToSplit = arr.indexOf('#');
                            //var first = arr.slice(0, indexToSplit);
                            //var second = arr.slice(indexToSplit + 1);
                            //indexToSplit = d_id.indexOf('#');
                            //id_first = d_id.slice(0, indexToSplit);
                            //id_second = d_id.slice(indexToSplit + 1);
                            //var html = '';
                            //html += '<tr id="remove-combo' + $('#hdGiftId').val() + '-' + id_second + '"><td>' + $('#tbdetailcombo tr').length + '</td>';
                            //html += '<td>' + proCode + '</td><td>' + first + '</td><td>' + second + '</td>';
                            //html += '<td><a href="#" title="Thêm sản phẩm vào chương trình" onclick="showmodal(' + $('#hdGiftId').val() + ')" data-toggle="modal" data-target="#addProductToGift" class="btn btn-sm btn-success" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-plus-sign"></i></a>';
                            //html += '<a href="#" title="Xóa sản phẩm" onclick="return removeDetailCombo(' + id_first + ',' + id_second + ');" class="btn btn-sm btn-danger" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-remove-circle"></i></a>';
                            //html += '<a href="#" title="Chỉnh sửa chương trình" onclick="return editDetailCombo(' + $('#hdGiftId').val() + ');" class="btn btn-sm btn-warning" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-edit"></i></a>';
                            //$('#tbdetailcombo').append(html);

                            showAlert('Đã thêm sản phẩm vào chương trình');
                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                            //$('#addProductToGift').modal('hide');
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function updateDetailCombo(id) {
            if (confirm("Bạn chắc chắn muốn cập nhật ?") == true) {
                
                var quan = $('#combo_quantity' + id).val();
                if (quan == '' || quan=='0') showAlert('Nhập số lượng sản phẩm');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateDetailCombo',
                        data: '{"id":"' + id + '","quantity":"' + quan + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Cập nhật thành công');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
            }
            return false;
        }
        function removeDetailCombo(id, proId) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/removeGiftDetail',
                    data: '{"id":"' + id + '","proId":"' + proId + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('#remove-combo' + id+'-'+proId).remove();
                            showAlert('Xóa thành công');
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function editDetailCombo(comboid) {
            showAlert(comboid);
            return false;
        }
        function addProduct() {
            var code = $('#productCode').val();
            //var group = $('#dlProductType').val();
            var branchType = $('#dlBranchType').val();
            var hd = $('#hdBranchType').val();
            var typesale= $('#dlTypeSale').val();

            if (code == '')
                showAlert('Nhập mã vạch sản phẩm');
            else
            {
                var price = $('#txtPrice').val();
                if (typesale == '4' && price == '')
                    showAlert('Nhập đơn giá khuyến mại');
                else {
                    //if (group != '') {
                    //    $.ajax({
                    //        type: 'POST',
                    //        url: '/Command.aspx/getProductIdByType',
                    //        data: '{"branchType":"' + branchType + '","typeId":"' + group + '"}',
                    //        contentType: 'application/json; charset=utf-8',
                    //        dataType: 'json',
                    //        success: function (data) {
                    //            if (hd != branchType) $('#data-detail tr').remove();
                    //            $('#hdBranchType').val($('#dlBranchType').val());
                    //            for (var i = 0; i < data.d.length; i++) {
                    //                var data_html = "";
                    //                var arr = data.d[i]._mess;
                    //                var indexToSplit = arr.indexOf('#');
                    //                var _code = arr.slice(0, indexToSplit);
                    //                var _name = arr.slice(indexToSplit + 1);
                    //                $("#data-detail tr").each(function () {
                    //                    var id = $(this).attr("product");
                    //                    if (id == data.d[i]._content) {
                    //                        $(this).remove();
                    //                    }
                    //                });
                    //                data_html += '<tr id="remove-' + data.d[i]._content + '" product="' + data.d[i]._content + '" product_id="' + data.d[i]._id + '">';
                    //                data_html += '<td>' + data.d[i]._content + '</td>';
                    //                data_html += '<td>' + _code + '</td>';
                    //                data_html += '<td>' + _name + '</td>';
                    //                data_html += '<td>---</td>';
                    //                data_html += '<td>';
                    //                data_html += '<a href="#" title="Xóa sản phẩm" onclick="return removeproduct(' + data.d[i]._content + ',\'' + _name + '\');" class="btn btn-sm btn-danger" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-remove-circle"></i></a></td>';
                    //                data_html += '</tr>';
                    //                $('#data-detail').append(data_html);
                    //                $('#productCode').val('');
                    //                $('#productCode').focus();
                    //                //$('#dlProductType').val('');
                    //                //$('#select2-dlProductType-container').text('Chọn theo mã vạch');
                    //            }
                    //        }
                    //    });
                    //}
                    //else {
                        if (code != '') {
                            $.ajax({
                                type: 'POST',
                                url: '/Command.aspx/getDetailProduct',
                                data: '{"branchTypeId":"' + branchType + '","codeId":"' + code + '"}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (data) {
                                    if (hd != branchType) $('#data-detail tr').remove();
                                    $('#hdBranchType').val($('#dlBranchType').val());

                                    if (data.d.OK == '1') {
                                        var data_html = "";

                                        $("#data-detail tr").each(function () {
                                            var id = $(this).attr("product");
                                            if (id == code) {
                                                $(this).remove();
                                            }
                                        });
                                        if (price == '') price = '0';
                                        data_html += '<tr id="remove-' + data.d.Id + '" product="' + data.d.CodeId + '" product_id="' + data.d.Id + '">';
                                        data_html += '<td>' + data.d.CodeId + '</td>';
                                        data_html += '<td>' + data.d.ProductCode + '</td>';
                                        data_html += '<td>' + data.d.ProductName + '</td>';
                                        data_html += '<td class="price' + data.d.Id + '">' + price + '</td>';
                                        data_html += '<td>';
                                        data_html += '<a href="#" title="Xóa sản phẩm" onclick="return removeproduct(' + data.d.Id + ',\'' + data.d.ProductName + '\');" class="btn btn-sm btn-danger" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-remove-circle"></i></a></td>';
                                        data_html += '</tr>';

                                        $('#data-detail').append(data_html);
                                        $('#productCode').val('');
                                        $('#txtPrice').val('');
                                        $('#productCode').focus();
                                    }
                                    else
                                        showAlert('Không tìm thấy sản phẩm có mã ' + code + '. Kiểm tra lại');
                                }
                            });
                        }
                    //}
                }
            }
            
            return false;
        }
        function saveChanges() {
            if (confirm("Bạn chắc chắn muốn lưu chương trình khuyến mại này ?") == true) {
                var branchTypeId = $('#dlBranchType').val();
                var branchId = $('#dlBranch').val();
                var name = $('#txtName').val();
                var type = $('#dlTypeSale').val();
                var price = $('#txtTotalPrice').val();
                var des = $('#txtDescription').val();
                var priority = $('#dlPriority').val();
                var status = $('#dlStatus').val();

                var start_hour = $('#txtFromHour').val();
                var fromdate = $('#txtFromDate').val();
                var to_hour = $('#txtToHour').val();
                var todate = $('#txtToDate').val();
                var data = "";

                $("#data-detail tr").each(function () {
                    var id = $(this).attr("product_id");
                    var _price = $('.price' + id).text();
                    if (_price == '') _price = '0';
                    if (data != "") data += "#";
                    data += id + '|' + _price;
                });

                if (data == "") showAlert('Chưa có dữ liệu nào để lưu');
                else if (price == '') showAlert('Nhập giá trị khuyến mại');
                else if (name == '') showAlert('Nhập tên chương trình khuyến mại');
                else if (start_hour == '' || to_hour == '' || fromdate == '' || todate == '')
                    showAlert('Nhập thời gian áp dụng khuyến mại');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertGift',
                        data: '{"branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","name":"' + name + '","des":"' + des + '","type":"' + type + '","minbill":"0","totalPrice":"' + price + '","priority":"' + priority + '","start_hour":"' + start_hour + '","fromdate":"' + fromdate + '","to_hour":"' + to_hour + '","todate":"' + todate + '","status":"' + status + '","data":"' + data + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Lưu chương trình khuyến mại thành công');
                                
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else
                                showAlert('Có lỗi khi lưu chương trình khuyến mại, chi tiết: ' + data.d._mess);
                        }
                    });
                }
            }
        }
        function getQuick() {
            var branchTypeId = $('#dlBranchType').val();
            if (branchTypeId == '')
                showAlert('Chọn chuỗi');
            else {
                $('#data-detail tr').remove();
                var q = $('#txtquick').val();
                var line = q.split('\n');
                var data = '';
                for (var t = 0; t < line.length; t++) {
                    if (line[t] != '') {
                        var sp = line[t].split('	');
                        if (data != '') data += '@';
                        data += sp[0] + '#' + sp[1].toString().trim();
                    }
                }

                var html = '';
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getProductByCodeId',
                    data: '{"branchTypeId":"' + branchTypeId + '","codeId":"' + data + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        $('#data-detail tr').remove();
                        for (var k = 0; k < data.d.length; k++) {
                            var data_html = "";

                            $("#data-detail tr").each(function () {
                                var id = $(this).attr("product");
                                if (id == data.d[k]._id) {
                                    $(this).remove();
                                }
                            });

                            data_html += '<tr id="remove-' + data.d[k]._id + '" product="' + data.d[k]._id + '" product_id="' + data.d[k]._id + '">';
                            data_html += '<td>' + (k+1) + '</td>';
                            data_html += '<td>' + data.d[k]._mess.split('#')[0] + '</td>';
                            data_html += '<td>' + data.d[k]._content.split('#')[0] + '</td>';
                            data_html += '<td>' + data.d[k]._content.split('#')[1] + '</td>';
                            data_html += '<td class="price' + data.d[k]._id + '">' + data.d[k]._mess.split('#')[1] + '</td>';
                            data_html += '<td>';
                            data_html += '<a href="#" title="Xóa sản phẩm" onclick="return removeproduct(' + data.d[k]._id + ',\'' + data.d[k]._content + '\');" class="btn btn-sm btn-danger" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-remove-circle"></i></a></td>';
                            data_html += '</tr>';

                            $('#data-detail').append(data_html);
                            $('#productCode').val('');
                            $('#txtPrice').val('');
                            $('#productCode').focus();
                        }

                    }
                });

                $('#quantity').val('1');
                $('#inputQuick').modal('hide');
            }
        }
    </script>
</asp:Content>


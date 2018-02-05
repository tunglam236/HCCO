<%@ Page Title="Danh sách combo" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Combo.aspx.cs" Inherits="Combo" %>

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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-cube"></i> Danh sách combo</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" class="btn btn-sm btn-success" onclick="showModalCombo();" data-toggle="modal" data-target="#addCombo"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm combo</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" />&nbsp;Chuỗi</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chi nhánh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã combo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên combo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" />&nbsp;Mô tả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tổng tiền</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Từ ngày</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đến ngày</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
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
                        <th class="bg-th">Mã combo</th>
                         <th class="bg-th">Tên combo</th>
                        <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Tổng tiền</th>
                        <th class="bg-th">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                        <th class="bg-th">Trạng thái</th>
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
                         <th class="bg-th">Mã combo</th>
                        <th class="bg-th">Tên combo</th>
                        <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Tổng tiền</th>
                        <th class="bg-th">Từ ngày</th>
                        <th class="bg-th">Đến ngày</th>
                         <th class="bg-th">Trạng thái</th>
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<input type="hidden" id="hdComboId" value="0" />
<div class="modal fade" id="addCombo" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i><span id="lb">THÊM CHƯƠNG TRÌNH COMBO</span> </h4>
                </div>
                <div class="modal-body">
                    <div style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Thông tin combo</div>
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
                            Mã combo<br />
                            <input type="text" id="txtComboCode" class="form-control" style="width: 100%;" />
                        </div>
                        
                    </div>
                    
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Tên combo<br />
                            <input type="text" id="txtComboName" class="form-control" style="width: 100%;" />
                        </div> 
                        <div class="col-md-4">Tổng tiền<br />
                            <input type="text" id="txtTotalPrice" class="input-price form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-2">Từ ngày<br />
                            <input type="text" id="txtFromDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                        <div class="col-md-2">Đến ngày<br />
                            <input type="text" id="txtToDate" class="input-date form-control datepicker2" maxlength="10" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-8">Mô tả combo<br />
                            <input type="text" id="txtDescription" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-4">Trạng thái<br />
                            <select id="dlStatus" class="form-control select2" style="width: 100%;">
                                <option value="1" selected="selected">Áp dụng</option>
                                <option value="2">Ngưng áp dụng</option>
                            </select>
                          </div>
                    </div>
                     <div class="dt_cb" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết sản phẩm combo</div>
                    <div class="row dt_cb" style="padding: 5px;">
                        <div class="col-md-8">
                            Mã vạch sản phẩm<br />
                            <input type="text" id="productCode" class="numbers form-control proCode" maxlength="20" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Số lượng<br />
                            <input type="text" id="quantity" class="numbers form-control proCode" maxlength="5" style="width: 100%;" />
                        </div>
                        
                    </div>
                     <div class="row dt_cb" style="padding: 5px;">
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
                            <button type="button" class="btn btn-success btnsave" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" class="btn btn-success btnadd" onclick="addProduct();">
                                Thêm sản phẩm</button>
                            <button type="button" class="btn btn-success btnupdate" onclick="updateChanges();">
                                Cập nhật</button>
                            <button type="button" class="btn btn-success btndelete" onclick="removeChanges();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdIdCombo" value="" />
<div class="modal fade" id="addProductToCombo" role="dialog">
        <div class="modal-dialog  modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-calculator" aria-hidden="true"></i>Thêm sản phẩm vào Combo</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-8">
                            Mã vạch sản phẩm<br />
                            <input type="text" id="ins_productCode" class="numbers form-control" maxlength="20" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Số lượng<br />
                            <input type="text" id="ins_quantity" class="numbers form-control" maxlength="5" value="1" style="width: 100%;" />
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
    <script>
        var options = ["2","3","4","6","7","8","9"];

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
                   "targets": [1,5],
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
                        url: '/Command.aspx/getComboDetail',
                        data: '{"comboId":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var data_html = '';
                            for (var i = 0; i < data.d.length; i++) {
                                data_html += '<tr id="remove-combo' + data.d[i].Id + '">';
                                data_html += '<td>' + (i + 1).toString() + '</td>';
                                data_html += '<td>' + data.d[i].CodeId + '</td>';
                                data_html += '<td>' + data.d[i].ProCode + '</td>';
                                data_html += '<td>' + data.d[i].ProName + '</td>';
                                data_html += '<td><input type="text" maxlength="5" class="format-input numbers" id="combo_quantity' + data.d[i].Id + '" value="' + data.d[i].Quantity + '" /></td>';
                                data_html += '<td>';
                                
                                data_html += '<a href="#" title="Thêm sản phẩm vào combo" onclick="showmodal(' + data.d[i].ComboId + ')" data-toggle="modal" data-target="#addProductToCombo" class="btn btn-sm btn-success" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-plus-sign"></i></a>';
                                data_html += '<a href="#" title="Xóa sản phẩm" onclick="return removeDetailCombo(' + data.d[i].Id + ');" class="btn btn-sm btn-danger" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-remove-circle"></i></a>';
                                data_html += '<a href="#" title="Chỉnh sửa combo" data-toggle="modal" data-target="#addCombo" onclick="return editDetailCombo(' + data.d[i].ComboId + ');" class="btn btn-sm btn-warning" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-edit"></i></a>';
                                data_html += '<a href="#" title="Cập nhật số lượng" onclick="return updateDetailCombo(' + data.d[i].Id + ');" class="btn btn-sm btn-primary" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-refresh"></i></a>' + '</td>';
                                data_html += '</tr>';

                            }
                            html = '<table id="tbdetailcombo" cellpadding="5" cellspacing="5" border="0" style="padding:50px; min-width:915px;width:95%; margin-left:25px;">' +
                                    '<tr>' +
                                        '<td class="bold" width="50px">STT</td>' +
                                        '<td class="bold">Mã vạch</td>' +
                                        '<td class="bold">Mã sản phẩm</td>' +
                                        '<td class="bold">Tên sản phẩm</td>' +
                                        '<td class="bold">Số lượng</td>' +
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
                var id = '#rows' + index;
                $(id).remove();
                showAlert('Đã xóa sản phẩm [' + name + ']');
            }
            return false;
        }
        function showmodal(idCombo) {
            $("#addProductToCombo").modal({ show: false });
            $('#ins_productCode').val('');
            $('#ins_quantity').val('1');
            $('#hdComboId').val(idCombo);
        }
        function ins_saveChanges() {
            var proCode = $('#ins_productCode').val();
            var quan = $('#ins_quantity').val();
            if (proCode == '' || quan == '' || quan=='0')
                showAlert('Nhập mã vạch sản phẩm và số lượng sản phẩm');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/insertProductCombo',
                    data: '{"idCombo":"' + $('#hdComboId').val() + '","productCode":"' + proCode + '","quantity":"' + quan + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {

                            var arr = data.d._mess;
                            var indexToSplit = arr.indexOf('#');
                            var first = arr.slice(0, indexToSplit);
                            var second = arr.slice(indexToSplit + 1);

                            var html = '';
                            html += '<tr id="remove-combo' + data.d._id + '"><td>' + $('#tbdetailcombo tr').length + '</td>';
                            html += '<td>' + proCode + '</td><td>' + first + '</td><td>' + second + '</td>';
                            html += '<td><input type="text" maxlength="5" class="format-input numbers" id="combo_quantity' + data.d._id + '" value="'+quan+'"></td>';
                            html += '<td><a href="#" title="Thêm sản phẩm vào combo" onclick="showmodal(' + $('#hdComboId').val() + ')" data-toggle="modal" data-target="#addProductToCombo" class="btn btn-sm btn-success" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-plus-sign"></i></a>';
                            html += '<a href="#" title="Xóa sản phẩm" onclick="return removeDetailCombo(' + data.d._id + ');" class="btn btn-sm btn-danger" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-remove-circle"></i></a>';
                            html += '<a href="#" title="Chỉnh sửa combo" onclick="return editDetailCombo(' + $('#hdComboId').val() + ');" class="btn btn-sm btn-warning" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-edit"></i></a>';
                            html += '<a href="#" title="Cập nhật số lượng" onclick="return updateDetailCombo(' + data.d._id + ');" class="btn btn-sm btn-primary" style="width:35px; margin-right:10px;"><i class="glyphicon glyphicon-refresh"></i></a></td></tr>';

                            $('#tbdetailcombo').append(html);

                            showAlert('Đã thêm sản phẩm vào combo');
                            $('#addProductToCombo').modal('hide');
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
        function removeDetailCombo(id) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/removeDetailCombo',
                    data: '{"id":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            $('#remove-combo' + id).remove();
                            showAlert('Xóa thành công');
                        }
                        else
                            showAlert(data.d._mess);
                    }
                });
            }
            return false;
        }
        function showModalCombo() {
            document.getElementById('lb').innerText = 'THÊM CHƯƠNG TRÌNH COMBO';
            $('#hdIdCombo').val('');
            $('.dt_cb').show();
            $('.btnsave').show();
            $('.btnadd').show();
            $('.btnupdate').hide();
            $('.btndelete').hide();
            $('#txtComboCode').val('');
            $('#txtComboName').val('');
            $('#txtTotalPrice').val('');
            $('#txtFromDate').val('');
            $('#txtToDate').val('');
            $('#txtDescription').val('');

            $("#addCombo").modal({ show: false });
            return false;
        }
        function editDetailCombo(comboid) {
            $('#hdIdCombo').val(comboid);
            $('.dt_cb').hide();
            $('.btnsave').hide();
            $('.btnadd').hide();
            $('.btnupdate').show();
            $('.btndelete').show();
            document.getElementById('lb').innerText = 'CẬP NHẬT THÔNG TIN COMBO';
            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getDetailCombo',
                data: '{"comboId":"' + comboid + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d.OK == '1') {
                        $('#dlBranchType').val(data.d.BranchType);
                        $('#select2-dlBranchType-container').text($('#dlBranchType option:selected').text());

                        var id_branchtype = data.d.BranchType;
                        var id_branch = data.d.Branch;

                        $('#dlBranch').find('option').remove().end();
                        $.ajax({
                            type: 'POST',
                            url: '/Command.aspx/getBranchByType',
                            data: '{"typeId":"' + id_branchtype + '"}',
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
                                $('#dlBranch').val(id_branch);
                                $('#select2-dlBranch-container').text($('#dlBranch option:selected').text());
                            }
                        });
                        $('#txtComboCode').val(data.d.ComboCode);
                        $('#txtComboName').val(data.d.Name);
                        $('#txtTotalPrice').val(data.d.Total);
                        $('#txtFromDate').val(data.d.FromDate);
                        $('#txtToDate').val(data.d.ToDate);
                        $('#dlStatus').val(data.d.Status);
                        $('#select2-dlStatus-container').text($('#dlStatus option:selected').text());
                        $('#txtDescription').val(data.d.Description);
                    }
                    else
                        showAlert(data.d.Mess);
                }
            });
            $("#addCombo").modal({ show: false });
            return false;
        }
        function addProduct() {
            var code = $('#productCode').val();
            var quantity = $('#quantity').val();
            if (quantity == '') quantity = '1';
            if (code != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getDetailProduct',
                    data: '{"branchTypeId":"' + $('#dlBranchType').val() + '","codeId":"' + code + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d.OK == '1') {
                            var html = "";
                            html += "<tr class='combo-rows' id='rows" + data.d.Id + "' data-code='" + data.d.Id + "'>" +
                                        "<td>" +
                                            "<a onclick='removeproduct(" + data.d.Id + ",\"" + data.d.ProductName + "\");'><i class='fa fa-trash-o' aria-hidden='true'></i></a>" +
                                        "</td>" +
                                        "<td>" + data.d.CodeId + "</td>" +
                                        "<td>" + data.d.ProductCode + "</td>" +
                                        "<td>" + data.d.ProductName + "</td>" +
                                        "<td><input type='text' class='format-input' id='quantity" + data.d.Id + "' value='" + quantity + "' /></td>" +
                                    '</tr>';
                            $('#data-detail').append(html);
                            $('#productCode').val('');
                            $('#productCode').focus();
                            $('#quantity').val('1');
                        }
                        else
                            showAlert('Không tìm thấy sản phẩm có mã ' + code + '. Kiểm tra lại');
                    }
                });
            }
            else showAlert('Nhập mã vạch sản phẩm');
            return false;
        }
        function saveChanges() {
            if (confirm("Bạn chắc chắn muốn lưu combo này ?") == true) {
                var branchTypeId = $('#dlBranchType').val();
                var branchId = $('#dlBranch').val();
                var code = $('#txtComboCode').val();
                var name = $('#txtComboName').val();
                var price = $('#txtTotalPrice').val();
                var fromdate = $('#txtFromDate').val();
                var todate = $('#txtToDate').val();
                var des = $('#txtDescription').val();
                var status = $('#dlStatus').val();
                var data = "";

                $(".combo-rows").each(function () {
                    var id = $(this).attr("data-code");
                    var quantity = $("#quantity" + id).val();
                    if (data != "") data += "#";
                    data += id + "," + quantity;
                });

                if (data == "") showAlert('Chưa có dữ liệu nào để lưu');
                else if (name == '') showAlert('Nhập tên chương trình combo');
                else if (price == '') showAlert('Nhập tổng tiền');
                else if (fromdate == '') showAlert('Nhập thời gian áp dụng');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertCombo',
                        data: '{"branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","combocode":"' + code + '","comboname":"' + name + '","totalPrice":"' + price + '","fromdate":"' + fromdate + '","todate":"' + todate + '","note":"' + des + '","status":"' + status + '","data":"' + data + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Lưu combo thành công');

                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else
                                showAlert('Có lỗi khi lưu combo, chi tiết: ' + data.d._mess);
                        }
                    });
                }
            }
        }
        function updateChanges() {
            if (confirm("Bạn chắc chắn muốn lưu combo này ?") == true) {
                var branchTypeId = $('#dlBranchType').val();
                var branchId = $('#dlBranch').val();
                var code = $('#txtComboCode').val();
                var name = $('#txtComboName').val();
                var price = $('#txtTotalPrice').val();
                var fromdate = $('#txtFromDate').val();
                var todate = $('#txtToDate').val();
                var des = $('#txtDescription').val();
                var status = $('#dlStatus').val();
                var id = $('#hdIdCombo').val();

                if (name == '') showAlert('Nhập tên chương trình combo');
                else if (price == '') showAlert('Nhập tổng tiền');
                else if (fromdate == '') showAlert('Nhập thời gian áp dụng');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateCombo',
                        data: '{"Id":"' + id + '","branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","combocode":"' + code + '","comboname":"' + name + '","totalPrice":"' + price + '","fromdate":"' + fromdate + '","todate":"' + todate + '","note":"' + des + '","status":"' + status + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Lưu combo thành công');

                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else
                                showAlert('Có lỗi khi lưu combo, chi tiết: ' + data.d._mess);
                        }
                    });
                }
            }
        }
        function removeChanges() {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                var id = $('#hdIdCombo').val();
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/removeCombo',
                    data: '{"Id":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {
                            showAlert('Đã xóa thành công combo');

                            setTimeout(function () {
                                window.location.href = window.location.href;
                            }, 1000);
                        }
                        else
                            showAlert('Có lỗi khi xóa combo, chi tiết: ' + data.d._mess);
                    }
                });
            }
        }
    </script>
</asp:Content>



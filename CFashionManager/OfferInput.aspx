<%@ Page Title="Đề xuất nhập hàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="OfferInput.aspx.cs" Inherits="OfferInput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="dist/css/client.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
       <div class="col-xs-12 col-md-2" style=" padding:10px;">
       <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-crosshairs"></i> Chuỗi cửa hàng</h4>
          </div>
          <div class="panel-collapse">
              <asp:RadioButtonList ID="rdBranchType" AutoPostBack="true" OnSelectedIndexChanged="rdBranchType_SelectedIndexChanged" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>

      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-sitemap"></i> Chi nhánh</h4>
          </div>
          <div class="panel-collapse">
              <asp:RadioButtonList ID="rdBranch" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
           <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-flash"></i> Trạng thái</h4>
          </div>
          <div class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdStatus" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                  <asp:ListItem Text="Tất cả" Value="" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Chờ duyệt" Value="1"></asp:ListItem>
                  <asp:ListItem Text="Đã duyệt" Value="2"></asp:ListItem>
                  <asp:ListItem Text="Không duyệt" Value="3"></asp:ListItem>
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sign-out"></i> Đề xuất nhập nguyên phụ liệu</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addDept();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDept"><i class="glyphicon glyphicon glyphicon-edit"></i> Tạo đề xuất</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chi nhánh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nội dung đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày nhận hàng</label> </a></li>
            
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1070px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày đề xuất</th>
                        <th class="bg-th">Số đề xuất</th>
                        <th class="bg-th">Nội dung đề xuất</th>
                        <th class="bg-th">Người đề xuất</th>
                        <th class="bg-th">Ngày nhận hàng</th>
                        
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                      <th class='bg-th center' width="40px">STT</th>
                       <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày đề xuất</th>
                        <th class="bg-th">Số đề xuất</th>
                        <th class="bg-th">Nội dung đề xuất</th>
                        <th class="bg-th">Người đề xuất</th>
                        <th class="bg-th">Ngày nhận hàng</th>
                        
                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="modal fade" id="addDept" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        <span id="lb">THÊM ĐỀ XUẤT</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            Chọn chuỗi<br />
                            <select id="dlBranchType" class="form-control select2" onchange="changeType($(this).val())" style="width: 100%;">
                             </select>
                        </div>
                        <div class="col-md-6">
                            Chọn chi nhánh<br />
                            <select id="dlBranch" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            Nội dung đề xuất<br />
                            <input type="text" id="txtDescription" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết đề xuất</div>
                        <div class="row" style="padding: 5px;"> 
                        <div class="col-md-4">Chọn nguyên phụ liệu<br /> 
                             <select id="dlMaterial" class="form-control select2" style="width: 100%;">
                             </select>
                         </div>
                        <div class="col-md-8">Nhà cung cấp<br /> 
                             <select id="dlSupplier" class="form-control select2" style="width: 100%;">
                             </select>
                         </div>
                       </div>
                        <div class="row" style="padding: 5px;">
                            <div class="col-md-4" style="margin-bottom:10px;">Số lượng đề xuất<br /> 
                                  <input type="text" id="txtQuantityOffer" class="numbers form-control" style="width: 100%;" />
                            </div>
                             <div class="col-md-2" style="margin-bottom:10px;">Đơn vị tính<br /> 
                                  <input type="text" id="txtUnit" class="form-control" style="width: 100%;" />
                            </div>
                            <div class="col-md-2" style="margin-bottom:10px;">Đơn giá nhập<br /> 
                                  <input type="text" id="txtPrice" class="numbers form-control" style="width: 100%;" />
                            </div>
                            <div class="col-md-4">
                                Ghi chú<br />
                                <input type="text" id="txtNote" class="form-control" style="width: 100%;" />
                            </div>
                        </div>
                        <div class="row" style="padding: 5px; max-height:250px; overflow-y:auto;max-width:100%; overflow-x:auto;">
                         <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" style="min-width: 850px; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th style="width:30px">Xóa</th>
                                    <th>Nguyên phụ liệu</th>
                                    <th>Nhà cung cấp</th>
                                    <th>Số lượng</th>
                                    <th>ĐVT</th>
                                    <th>Đơn giá</th>
                                    <th>Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                        </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            <button type="button" id="addItem" title="Thêm nguyên phụ liệu" class="btn btn-warning" onclick="addMaterial();">
                                Thêm NPL</button>
                                 <button type="button" id="saveDept" class="btn btn-success" onclick="saveChanges();">
                                Lưu đề xuất</button>
                            <button type="button" id="removeDept" title="Xóa đề xuất này" style="display:none;" class="btn btn-danger" onclick="deleteDept();">
                                Xóa</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">
                                Đóng lại</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <script>
        var options = ["1", "2", "3","4","5","6","7"];

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
                    if (e.which == 44 || e.which == 46) return true;
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
                "order": [[0, 'asc']],
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
            });
        });
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
                    loadSupplierbyType($('#dlBranchType').val());
                }
            });
        });
    </script>
    <script type="text/javascript">
        function update_modal(id, branchtype, branch, note, status) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#txtDescription').val(note);
            $('#dlBranchType').val(branchtype);
            $('#select2-dlBranchType-container').text($('#dlBranchType option:selected').text());
            
            $('#dlBranch').find('option').remove().end();
            var c1 = document.getElementById('dlBranch');
            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn chi nhánh';
            c1.appendChild(opt_);

            $('#dlMaterial').find('option').remove().end();
            var c2 = document.getElementById('dlMaterial');
            var opt2_ = document.createElement('option');
            opt2_.value = '';
            opt2_.innerHTML = 'Chọn sản phẩm';
            c2.appendChild(opt2_);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getBranchByType',
                data: '{"typeId":"' + branchtype + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c1.appendChild(opt);
                    }
                    $('#dlBranch').val(branch);
                    $('#select2-dlBranch-container').text($('#dlBranch option:selected').text());
                }
            });

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadMaterial',
                data: '{"branchtype":"' + branchtype + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        c2.appendChild(opt);
                    }
                }
            });
            loadSupplierbyType(branchtype);

            document.getElementById('lb').innerText = 'CẬP NHẬT PHIẾU ĐỀ XUẤT';

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/OfferMaterialDetail',
                data: '{"Id":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var html = "";
                    for (var t = 0; t < data.d.length; t++) {
                        html = '';
                        html += '<tr data-id="' + data.d[t].MaterialId + '' + data.d[t].SupplierId + '" data-mat="' + data.d[t].MaterialId + '" data-sup="' + data.d[t].SupplierId + '" id="rows' + data.d[t].MaterialId + '' + data.d[t].SupplierId + '">';
                        if (status == 1) {
                            html += '<td><a onclick="removeproduct(' + data.d[t].MaterialId + '' + data.d[t].SupplierId + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                            $('#removeDept').show();
                            $('#saveDept').show();
                            $('#addItem').show();
                        }
                        else {
                            html += '<td></td>';
                            $('#removeDept').hide();
                            $('#saveDept').hide();
                            $('#addItem').hide();
                        }
                        html += '<td>' + data.d[t].MaterialCode + ' | ' + data.d[t].MaterialName + '</td>';
                        html += '<td>' + data.d[t].SupplierName + '</td>';
                        html += '<td><input type="text" maxlength="6" class="numbers format-input" id="quantityOffer' + data.d[t].MaterialId + '' + data.d[t].SupplierId + '" value="' + data.d[t].QuantityOffer + '" /></td>';
                        html += '<td><input type="text" maxlength="20" class="format-input" id="unit' + data.d[t].MaterialId + '' + data.d[t].SupplierId + '" value="' + data.d[t].UnitName + '" /></td>';
                        html += '<td><input type="text" maxlength="10" class="numbers format-input" id="price' + data.d[t].MaterialId + '' + data.d[t].SupplierId + '" value="' + data.d[t].Price + '" /></td>';
                        html += '<td><input type="text" maxlength="128" class="format-input-text" id="note' + data.d[t].MaterialId + '' + data.d[t].SupplierId + '" value="' + data.d[t].Note + '" /></td>';
                        html += '</tr>';
                        $('#data-detail-soi').append(html);

                        setTimeout(function () {
                            $(".numbers").keypress(function (e) {
                                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                                    return false;
                                }
                            });
                        }, 1000);

                    }
                }
            });
        }
        function addDept() {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val('');
            $('#txtDescription').val('');
            $('#txtQuantityOffer').val('');
            //$('#txtQuantity').val('');
            $('#txtUnit').val('');
            $('#txtPrice').val('');
            $('#txtNote').val('');

            $('#removeDept').hide();
            $('#addItem').show();
            $('#saveDept').show();
            $("#data-detail-soi tr").remove();
            
            document.getElementById('lb').innerText = 'THÊM ĐỀ XUẤT NHẬP';
        }
        function saveChanges() {
                var des = $('#txtDescription').val();
                var branchTypeId = $('#dlBranchType').val();
                var branchId = $('#dlBranch').val();

                if (branchTypeId == '') showAlert('Chọn chuỗi');
                else if (branchId == '') showAlert('Chọn chi nhánh');
                else if (des == '') showAlert('Nhập nội dung đề xuất');
                else {
                    var data = "";
                    $("#data-detail-soi tr").each(function () {
                        var id = $(this).attr("data-id");
                        var mat_id = $(this).attr("data-mat");
                        var sup_id = $(this).attr("data-sup");

                        var quantityOffer = $('#quantityOffer' + id).val();
                        //var quantity = $('#quantity' + id).val();
                        var unit = $('#unit' + id).val();
                        var price = $('#price' + id).val().replace(/,/g, '');
                        var note = $('#note' + id).val();
                        if (data != '') data += '#';
                        data += mat_id + '|' + sup_id + '|' + quantityOffer + '|' + quantityOffer + '|' + price + '|' + unit + '|' + note
                    });
                    if (data != '') {
                        var id = $('#hdDeptId').val();

                        if (id == '') {
                            if (confirm("Bạn chắc chắn muốn lưu ?") == true) {
                                $.ajax({
                                    type: 'POST',
                                    url: '/Command.aspx/insertOfferMaterial',
                                    data: '{"branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","note":"' + des + '","data":"' + data + '"}',
                                    contentType: 'application/json; charset=utf-8',
                                    dataType: 'json',
                                    success: function (data) {
                                        if (data.d._content == '1') {
                                            showAlert('Đã thêm phiếu đề xuất nhập');
                                            
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
                        else {
                            updateChanges();
                        }
                    }
                    else
                        showAlert('Chưa có dữ liệu nào để lưu');
                }
            
            return false;
        }
        function updateChanges() {
            if (confirm("Bạn chắc chắn muốn cập nhật phiếu đề xuất ?") == true) {                
                var des = $('#txtDescription').val();
                var branchTypeId = $('#dlBranchType').val();
                var branchId = $('#dlBranch').val();

                if (branchTypeId == '') showAlert('Chọn chuỗi');
                else if (branchId == '') showAlert('Chọn chi nhánh');
                else if (des == '') showAlert('Nhập nội dung đề xuất');
                else {
                    var data = "";
                    $("#data-detail-soi tr").each(function () {
                        var id = $(this).attr("data-id");
                        var mat_id = $(this).attr("data-mat");
                        var sup_id = $(this).attr("data-sup");

                        var quantityOffer = $('#quantityOffer' + id).val();
                        //var quantity = $('#quantity' + id).val();
                        var unit = $('#unit' + id).val();
                        var price = $('#price' + id).val().replace(/,/g, '');
                        var note = $('#note' + id).val();
                        if (data != '') data += '#';
                        data += mat_id + '|' + sup_id + '|' + quantityOffer + '|' + quantityOffer + '|' + price + '|' + unit + '|' + note
                    });
                    if (data != '') {
                        var id_offer = $('#hdDeptId').val();
                        console.log(id_offer);

                        if (id_offer != '') {
                            $.ajax({
                                type: 'POST',
                                url: '/Command.aspx/updateOfferMaterial',
                                data: '{"Id":"' + id_offer + '","branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","note":"' + des + '","data":"' + data + '"}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (data) {
                                    if (data.d._content == '1') {
                                        showAlert('Đã cập nhật phiếu đề xuất');
                                        
                                        setTimeout(function () {
                                            window.location.href = window.location.href;
                                        }, 1000);
                                    }
                                    else
                                        showAlert(data.d._mess);
                                }
                            });
                        }
                        else
                            showAlert('Chưa tìm thấy bản ghi cần cập nhật');
                    }
                    else
                        showAlert('Chưa có dữ liệu nào để lưu');
                }
                
            }
        }
        function deleteDept() {
            var id = $('#hdDeptId').val();
            if (confirm("Bạn chắc chắn muốn xóa phiếu đề xuất ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteOfferMaterial',
                        data: '{"Id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdDeptId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa phiếu đề xuất');
                                $("#addDept").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn phiếu đề xuất muốn xóa');
            }
        }
        function removeproduct(index) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                var id = '#rows' + String(index);
                $(id).remove();
                showAlert('Đã xóa nguyên phụ liệu ');
            }
            return false;
        }
        function addMaterial() {
            var materialId = $('#dlMaterial').val();
            var mat_name = $('#dlMaterial option:selected').text();
            var supplierId = $('#dlSupplier').val();
            var sup_name = $('#dlSupplier option:selected').text();
            
            var quanOffer = $('#txtQuantityOffer').val();
            var unit = $('#txtUnit').val();
            var price = $('#txtPrice').val();
            var note = $('#txtNote').val();

            if(materialId=='') showAlert('Chọn nguyên phụ liệu');
            else if (supplierId == '') showAlert('Chọn nhà cung cấp');
            else if (quanOffer == '') showAlert('Nhập số lượng đề xuất');
            else if (unit == '') showAlert('Nhập đơn vị tính');
            else if (price == '') showAlert('Nhập đơn giá');
            else {
                var ok = true;
                $("#data-detail-soi tr").each(function () {
                    var _mat = $(this).attr("data-mat");
                    var _sup = $(this).attr("data-sup");

                    if (_mat == materialId && supplierId == _sup) ok = false;
                });
                if (ok) {
                    var html = '';
                    html += '<tr data-id="' + materialId + '' + supplierId + '" data-mat="' + materialId + '" data-sup="' + supplierId + '" id="rows' + materialId + '' + supplierId + '">';
                    html += '<td><a onclick="removeproduct(' + materialId + '' + supplierId + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                    html += '<td>' + mat_name + '</td>';
                    html += '<td>' + sup_name + '</td>';
                    html += '<td><input type="text" maxlength="6" class="numbers format-input" id="quantityOffer' + materialId + '' + supplierId + '" value="' + quanOffer + '" /></td>';
                    html += '<td><input type="text" maxlength="20" class="format-input" id="unit' + materialId + '' + supplierId + '" value="' + unit + '" /></td>';
                    html += '<td><input type="text" maxlength="10" class="numbers format-input" id="price' + materialId + '' + supplierId + '" value="' + price + '" /></td>';
                    html += '<td><input type="text" maxlength="128" class="format-input-text" id="note' + materialId + '' + supplierId + '" value="' + note + '" /></td>';
                    html += '</tr>';
                    $('#data-detail-soi').append(html);

                    $('#txtQuantityOffer').val('');
                    //$('#txtQuantity').val('');
                    $('#txtUnit').val('');
                    $('#txtPrice').val('');
                    $('#txtNote').val('');

                    setTimeout(function () {
                        $(".numbers").keypress(function (e) {
                            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                                return false;
                            }
                        });
                    }, 1000);

                }
                else
                    showAlert('Đã tồn tại nguyên liệu [' + mat_name + '] và nhà cung cấp [' + sup_name + ']');
            }
            return false;
        }
    </script>
    <script>
        function changeType(id) {
            $('.process-loading').show();
            $('#data-detail tr').remove();
            loadBranchbyType(id);

            loadSupplierbyType(id);
            $('.process-loading').hide();
        }
        function loadBranchbyType(id) {
            $('#dlBranch').find('option').remove().end();
            var c1 = document.getElementById('dlBranch');
            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn chi nhánh';
            c1.appendChild(opt_);

            $('#dlMaterial').find('option').remove().end();
            var c2 = document.getElementById('dlMaterial');
            var opt2_ = document.createElement('option');
            opt2_.value = '';
            opt2_.innerHTML = 'Chọn sản phẩm';
            c2.appendChild(opt2_);

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

                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/loadMaterial',
                    data: '{"branchtype":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i]._content;
                            opt.innerHTML = data.d[i]._mess;
                            c2.appendChild(opt);
                        }
                    }
                });
            }
        }
        function loadSupplierbyType(id) {
            $('#dlSupplier').find('option').remove().end();
            var c1 = document.getElementById('dlSupplier');
            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn nhà cung cấp';
            c1.appendChild(opt_);

            if (id != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/getSupplierByType',
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
        }
    </script>
</asp:Content>


<%@ Page Title="Đề xuất nhập hàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="OfferInput.aspx.cs" Inherits="OfferInput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="dist/css/client.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
       <div class="col-xs-12 col-md-12">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sign-out"></i> Đề xuất nguyên phụ liệu</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addDept();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDept"><i class="glyphicon glyphicon glyphicon-edit"></i> Tạo đề xuất</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nguyên phụ liệu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số lượng đề xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số lượng nhập</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đơn vị tính</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhà cung cấp</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Đơn giá nhập</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:1300px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Số đề xuất</th>
                         <th class="bg-th">Ngày đề xuất</th>
                        <th class="bg-th">Người đề xuất</th>
                         <th class="bg-th">Nguyên phụ liệu</th>
                         <th class="bg-th">SL đề xuất</th>
                        <th class="bg-th">SL nhập</th>
                        <th class="bg-th">ĐVT</th>
                         <th class="bg-th">Nhà cung cấp</th>
                         <th class="bg-th">Đơn giá nhập</th>
                         <th class="bg-th">Ghi chú</th>
                        <th class="bg-th">Trạng thái</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                      <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Số đề xuất</th>
                         <th class="bg-th">Ngày đề xuất</th>
                        <th class="bg-th">Người đề xuất</th>
                         <th class="bg-th">Nguyên phụ liệu</th>
                         <th class="bg-th">SL đề xuất</th>
                        <th class="bg-th">SL nhập</th>
                        <th class="bg-th">ĐVT</th>
                         <th class="bg-th">Nhà cung cấp</th>
                         <th class="bg-th">Đơn giá nhập</th>
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
                            <div class="col-md-2" style="margin-bottom:10px;">Số lượng đề xuất<br /> 
                                  <input type="text" id="txtQuantityOffer" class="numbers form-control" style="width: 100%;" />
                            </div>
                            <div class="col-md-2" style="margin-bottom:10px;">Số lượng nhập<br /> 
                                  <input type="text" id="txtQuantity" class="numbers form-control" style="width: 100%;" />
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
                                    <th>SL đề xuất</th>
                                    <th>SL nhập</th>
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
                             <span class=" btn-group">
                            <button type="button" id="addItem" title="Thêm nguyên phụ liệu" class="btn btn-success" onclick="addMaterial();">
                                Thêm NPL</button>
                                 <button type="button" id="saveDept" class="btn btn-success" onclick="saveChanges();">
                                Lưu đề xuất</button>
                            <button type="button" id="removeDept" title="Xóa đề xuất này" style="display:none;" class="btn btn-success" onclick="deleteDept();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng lại</button></span>
                            &nbsp;<label> <input type="checkbox" id="ckAutoLoad" checked="checked" /> Auto load</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <script>
        var options = ["1", "2", "3","4"];

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
            });
        });
    </script>
    <script type="text/javascript">
         $(document).ready(function () {
            $('#dlMaterial').find('option').remove().end();
            var c1 = document.getElementById('dlMaterial');
            var op = document.createElement('option');
            op.value = '';
            op.innerHTML = 'Chọn nguyên phụ liệu';
            c1.appendChild(op);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadMaterial',
                data: '{"branchtype":"2"}',
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

            $('#dlSupplier').find('option').remove().end();
            var c2 = document.getElementById('dlSupplier');
            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn nhà cung cấp';
            c2.appendChild(opt_);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getSupplierByType',
                data: '{"typeId":"2"}',
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
        });
    </script>
    <script type="text/javascript">
        function update_modal(id, type, code, name,month, des,edit) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#txtCode').val(code);
            $('#txtName').val(name);
            $('#txtMonth').val(month);
            $('#dlProductType').val(type);
            $('#select2-dlProductType-container').text($('#dlProductType option:selected').text());
            $('#txtDescription').val(des);
            if (edit==1) {
                $('#removeDept').show();
                $('#saveDept').show();
            }
            else {
                $('#removeDept').hide();
                $('#saveDept').hide();
            }
            document.getElementById('lb').innerText = 'CẬP NHẬT MẪU THIẾT KẾ';

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/getDetailForm',
                data: '{"id":"' + id + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    $("#data-detail-soi tr").remove();
                    var type_name = '';
                    var html = "";
                    for (var t = 0; t < data.d.length; t++) {
                        html = '';
                        type_name = data.d[t].TypeName == '0' ? 'Chọn loại' : data.d[t].TypeName == '1' ? 'Vải chính' :
                            data.d[t].TypeName == '2' ? 'Vải lót' : data.d[t].TypeName == '3' ? 'Vải phối' : 'Nguyên phụ liệu';
                        html += '<tr data-id="' + data.d[t].MaterialId + '" data-type="' + data.d[t].TypeName + '" id="rows' + data.d[t].MaterialId + '"><td><a onclick="removeproduct(' + data.d[t].MaterialId + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td><td>' + data.d[t].MaterialName + '</td><td>' + type_name + '</td><td><input type="text" class="numbers format-input" ' + (data.d[t].TypeName == '1' || data.d[t].TypeName == '2' ? "disabled" : "") + ' id="quantity' + data.d[t].MaterialId + '" value="' + data.d[t].Norm + '" /></td></tr>';
                        $('#data-detail-soi').append(html);
                    }
                }
            });
        }
        function addDept() {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val('');
            $('#txtCode').val('');
            $('#txtName').val('');
            $('#txtMonth').val('');
            $('#txtQuantity').val('');
            $('#txtDescription').val('');
            $('#removeDept').hide();
            $("#data-detail-soi tr").remove();
            $('#saveDept').show();
            document.getElementById('lb').innerText = 'THÊM ĐỀ XUẤT NHẬP';
        }
        function saveChanges() {
            var des = $('#txtDescription').val();

            if (des == '') showAlert('Nhập nội dung đề xuất');
            else {
                var data = "";
                $("#data-detail-soi tr").each(function () {
                    var id = $(this).attr("data-id");
                    var mat_id = $(this).attr("data-mat");
                    var sup_id = $(this).attr("data-sup");

                    var quantityOffer = $('#quantityOffer' + id).val();
                    var quantity = $('#quantity' + id).val();
                    var unit = $('#unit' + id).val();
                    var price = $('#price' + id).val().replace(/,/g, '');
                    var note = $('#note' + id).val();
                    if (data != '') data += '#';
                    data += mat_id + '|' + sup_id + '|' + quantityOffer + '|' + quantity + '|' + price + '|' + unit + '|' + note
                });
                if (data != '') {
                    var id = $('#hdDeptId').val();

                    if (id == '') {
                        $.ajax({
                            type: 'POST',
                            url: '/Command.aspx/OfferMaterial',
                            data: '{"note":"' + des + '","data":"' + data + '"}',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (data) {
                                if (data.d._content == '1') {
                                    showAlert('Đã thêm phiếu đề xuất nhập');
                                    if (ckload) {
                                        setTimeout(function () {
                                            window.location.href = window.location.href;
                                        }, 1000);
                                    }
                                    else
                                    {
                                        $('#txtDescription').val('');
                                        $("#data-detail-soi tr").remove();
                                    }
                                }
                                else
                                    showAlert(data.d._mess);
                            }
                        });
                    }
                    else
                    {
                        //updateChanges();
                    }
                }
                else
                    showAlert('Chưa có dữ liệu nào để lưu');
            }
            return false;
        }
        function updateChanges() {
            if (confirm("Bạn chắc chắn muốn cập nhật mẫu " + $('#txtName').val() + " ?") == true) {
                var id = $('#hdDeptId').val();
                var code = $('#txtCode').val();
                var name = $('#txtName').val();
                var month = $('#txtMonth').val();
                var des = $('#txtDescription').val();
                var pro_type = $('#dlProductType').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                var data = "";
                $("#data-detail-soi tr").each(function () {
                    var id = $(this).attr("data-id");
                    var type = $(this).attr("data-type");
                    var q = $('#quantity' + id).val();

                    if (data != "") data += "#";
                    data += id + ',' + type + ',' + q;
                });

                if (code == '') showAlert('Nhập mã thiết kế');
                else if (name == '') showAlert('Nhập tên mẫu');
                else if (pro_type == '') showAlert('Chọn loại mẫu');
                else if (data == '') showAlert('Chưa có dữ liệu nào');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateForm',
                        data: '{"id":"' + id + '","code":"' + code + '","name":"' + name + '","month":"' + month + '","des":"' + des + '","normid":"' + pro_type + '","data":"' + data + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã cập nhật mẫu [' + name + ']');
                                if (ckload) {
                                    setTimeout(function () {
                                        window.location.href = window.location.href;
                                    }, 1000);
                                }
                                else {
                                    $('#txtCode').val('');
                                    $('#txtName').val('');
                                    $('#txtMonth').val('');
                                    $('#txtDescription').val('');
                                    $('#txtCode').focus();
                                    $(".crop-loading").hide();
                                    $("#addDept").modal('hide');
                                }
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
            }
        }
        function deleteDept() {
            var id = $('#hdDeptId').val();
            var name = $('#txtName').val();
            if (confirm("Bạn chắc chắn muốn xóa mẫu [" + name + "] ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteForm',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdDeptId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa mẫu [' + name + ']');
                                $("#addDept").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn mẫu muốn xóa');
            }
        }
        function selectMaterial() {
            var id = $('#dlMaterial').val();
            var name = $('#dlMaterial option:selected').text();
            var type_id = $('#dlType').val();
            var type_name = $('#dlType option:selected').text();
            var quan = $('#txtQuantity').val();
            var pro_type = $('#dlProductType').val();
            var ok = true;

            if (id == '') showAlert('Chọn nguyên phụ liệu');
            else if (type_id == 0)
                showAlert('Chọn loại nguyên phụ liệu');
            else if ((type_id == 1 || type_id == 2) && pro_type == '')
                showAlert('Chọn loại mẫu');
            else if (type_id != 1 && type_id!=2 && quan == '')
                showAlert('Nhập định mức');
            else {
                $("#data-detail-soi tr").each(function () {
                    var _id = $(this).attr("data-id");
                    if (_id == id) ok = false;
                });

                if (ok) {
                    if (type_id == 1 || type_id == 2) {
                        $.ajax({
                            type: 'POST',
                            url: '/Command.aspx/getNormByType',
                            data: '{"productTypeId":"' + pro_type + '","type":"' + type_id + '"}',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (data) {
                                quan = data.d;
                                var html = "";
                                html += '<tr data-id="' + id + '" data-type="' + type_id + '" id="rows' + id + '"><td><a onclick="removeproduct(' + id + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td><td>' + name + '</td><td>' + type_name + '</td><td><input type="text" class="numbers format-input" disabled id="quantity' + id + '" value="' + quan + '" /></td></tr>';
                                $('#data-detail-soi').append(html);
                                $('#txtQuantity').val('');
                            }
                        });
                    }
                    else {
                        var html = "";
                        html += '<tr data-id="' + id + '" data-type="' + type_id + '" id="rows' + id + '"><td><a onclick="removeproduct(' + id + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td><td>' + name + '</td><td>' + type_name + '</td><td><input type="text" class="numbers format-input" id="quantity' + id + '" value="' + quan + '" /></td></tr>';
                        $('#data-detail-soi').append(html);
                        $('#txtQuantity').val('');
                    }
                }
                else
                    showAlert('Đã tồn tại nguyên phụ liệu ' + name);
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
        function changeType() {
            var t = $('#dlType').val();
            if (t == 1 || t == 2) {
                $("#txtQuantity").prop('disabled', true);
                $('#txtQuantity').val('');
            }
            else {
                $("#txtQuantity").prop('disabled', false);
                $('#txtQuantity').val('');
                $('#txtQuantity').focus();
            }
        }
        function changeProductType() {
            $("#data-detail-soi tr").remove();
        }
        function addMaterial() {
            var materialId = $('#dlMaterial').val();
            var mat_name = $('#dlMaterial option:selected').text();
            var supplierId = $('#dlSupplier').val();
            var sup_name = $('#dlSupplier option:selected').text();
            
            var quanOffer = $('#txtQuantityOffer').val();
            var quan = $('#txtQuantity').val();
            var unit = $('#txtUnit').val();
            var price = $('#txtPrice').val();
            var note = $('#txtNote').val();

            if(materialId=='') showAlert('Chọn nguyên phụ liệu');
            else if (supplierId == '') showAlert('Chọn nhà cung cấp');
            else if (quanOffer == '') showAlert('Nhập số lượng đề xuất');
            else if (quan == '') showAlert('Nhập số lượng nhập');
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
                    html += '<td><input type="text" class="numbers format-input" id="quantityOffer' + materialId + '' + supplierId + '" value="' + quanOffer + '" /></td>';
                    html += '<td><input type="text" class="numbers format-input" id="quantity' + materialId + '' + supplierId + '" value="' + quan + '" /></td>';
                    html += '<td><input type="text" class="numbers format-input" id="unit' + materialId + '' + supplierId + '" value="' + unit + '" /></td>';
                    html += '<td><input type="text" class="numbers format-input" id="price' + materialId + '' + supplierId + '" value="' + price + '" /></td>';
                    html += '<td><input type="text" class="format-input-text" id="note' + materialId + '' + supplierId + '" value="' + note + '" /></td>';
                    html += '</tr>';
                    $('#data-detail-soi').append(html);
                }
                else
                    showAlert('Đã tồn tại nguyên liệu [' + mat_name + '] và nhà cung cấp [' + sup_name + ']');
            }
            return false;
        }
    </script>
</asp:Content>


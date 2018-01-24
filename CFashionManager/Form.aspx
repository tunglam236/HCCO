<%@ Page Title="Quản lý mẫu thiết kế" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Form" %>
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
            <h4 class="panel-title"><i class="fa fa-flash"></i> Trạng thái</h4>
          </div>
          <div class="panel-collapse">
              <asp:RadioButtonList ID="rdStatus" CssClass="rdList" runat="server" RepeatDirection="Vertical">
                  <asp:ListItem Text="Tất cả" Value="0" Selected="True"></asp:ListItem>
                  <asp:ListItem Text="Chờ duyệt" Value="1"></asp:ListItem>
                  <asp:ListItem Text="Đã duyệt" Value="2"></asp:ListItem>
                  <asp:ListItem Text="Không duyệt" Value="3"></asp:ListItem>
              </asp:RadioButtonList>
          </div>
        </div>
      </div>
      <div class="panel-group">
        <div class="panel panel-success">
          <div class="panel-heading" style="background-color:#27AE60; color:#ffffff;">
            <h4 class="panel-title"><i class="fa fa-user"></i> Thiết kế</h4>
          </div>
          <div class="panel-collapse" style="padding:5px;">
              <asp:RadioButtonList ID="rdUser" CssClass="rdList" runat="server" RepeatDirection="Vertical">
              </asp:RadioButtonList>
              <asp:Button ID="Button1" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-primary" Width="99%" Text="Xem dữ liệu" />
          </div>
        </div>
      </div>
      </div>
       <div class="col-xs-12 col-md-10">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-female"></i> Quản lý mẫu thiết kế</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addDept();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDept"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm mẫu thiết kế</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Loại mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu tháng</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="8" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Màu sắc</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="9" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mô tả</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="10" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày tạo</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="11" tabIndex="-1"><label><input type="checkbox" />&nbsp;Người duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="12" tabIndex="-1"><label><input type="checkbox" />&nbsp;Ngày duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="13" tabIndex="-1"><label><input type="checkbox" />&nbsp;Nội dung duyệt</label> </a></li>
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
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Duyệt</th>
                         <th class="bg-th">Người thiết kế</th>
                          <th class="bg-th">Loại mẫu</th>
                         <th class="bg-th">Mã thiết kế</th>
                        <th class="bg-th">Tên mẫu</th>
                         <th class="bg-th">Mẫu tháng</th>
                         <th class="bg-th">Màu sắc</th>
                         <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Ngày tạo</th>
                         <th class="bg-th">Người duyệt</th>
                         <th class="bg-th">Ngày duyệt</th>
                         <th class="bg-th">Nội dung duyệt</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px">STT</th>
                      <th class="bg-th">Trạng thái</th>
                         <th class="bg-th">Duyệt</th>
                         <th class="bg-th">Người thiết kế</th>
                          <th class="bg-th">Loại mẫu</th>
                         <th class="bg-th">Mã thiết kế</th>
                        <th class="bg-th">Tên mẫu</th>
                         <th class="bg-th">Mẫu tháng</th>
                         <th class="bg-th">Màu sắc</th>
                         <th class="bg-th">Mô tả</th>
                        <th class="bg-th">Ngày tạo</th>
                         <th class="bg-th">Người duyệt</th>
                         <th class="bg-th">Ngày duyệt</th>
                         <th class="bg-th">Nội dung duyệt</th>
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
                        <span id="lb">THÊM MẪU THIẾT KẾ</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Mã thiết kế<br />
                            <input type="text" id="txtCode" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-4">Tên mẫu<br />
                            <input type="text" id="txtName" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-2">Mẫu tháng<br />
                             <input type="text" id="txtMonth" placeholder="tháng/năm" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-2">Hình ảnh<br />
                             <input type="file" id="fileForm" class="form-control" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                         <div class="col-md-4">Loại mẫu<br />
                            <select id="dlProductType" class="form-control select2" onchange="changeProductType();" style="width: 100%;">
                            </select>
                        </div>
                        <div class="col-md-4">
                            Màu sắc dự kiến<br />
                            <input type="text" id="txtColor" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Mô tả thiết kế<br />
                            <input type="text" id="txtDescription" class="form-control" style="width: 100%;" />
                        </div>
                        </div>
                    <div class=" input-hide" style="font-weight: bold; text-transform: uppercase; font-size: 16px; text-align: center;">
                        Chi tiết nguyên phụ liệu</div>
                    <div class="row input-hide" style="padding: 5px;max-height: 300px;overflow-y: scroll;">
                         <div class="col-md-6">Chọn nguyên phụ liệu<br /> 
                             <select id="dlMaterial" class="form-control select2" style="width: 100%;">
                             </select>
                         </div>
                        <div class="col-md-4">Loại nguyên phụ liệu<br /> 
                             <select id="dlType" class="form-control select2" style="width: 100%;">
                                 <option value="0">Chọn loại</option>
                                 <option value="1">Vải chính</option>
                                 <option value="2">Vải lót</option>
                                 <option value="3">Vải phối</option>
                                 <option value="4">Nguyên phụ liệu</option>
                             </select>
                         </div>
                        <div class="col-md-2"><br /> 
                              <button type="button" class="btn btn-success" onclick="selectMaterial();">Chọn</button>
                        </div>

                        <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 97%; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th style="width:30px">
                                        Xóa
                                    </th>
                                    <th>
                                        Loại
                                    </th>
                                     <th>
                                        Nguyên phụ liệu
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            <button type="button" id="saveDept" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="removeDept" style="display:none;" class="btn btn-danger" onclick="deleteDept();">
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
        var options = ["1","2","3","4","5","6","7","8","9"];

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
                    if (e.which == 46) return true;
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
                "columnDefs": [
               {
                   "targets": [10,11,12,13],
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
             $('#dlProductType').find('option').remove().end();
             var c2 = document.getElementById('dlProductType');
             var op = document.createElement('option');
             op.value = '';
             op.innerHTML = 'Chọn loại mẫu';
             c2.appendChild(op);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadProductType',
                data: '{"branchType":"2"}',
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
        });
    </script>
    <script type="text/javascript">
        function update_modal(id, type, code, name,month,color, des,edit) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#txtCode').val(code);
            $('#txtName').val(name);
            $('#txtMonth').val(month);
            $('#txtColor').val(color);
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
                        html += '<tr data-id="' + data.d[t].MaterialId + '" data-type="' + data.d[t].TypeName + '" id="rows' + data.d[t].MaterialId + '"><td><a onclick="removeproduct(' + data.d[t].MaterialId + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td><td>' + data.d[t].MaterialName + '</td><td>' + type_name + '</td>';
                        //html += '<td><input type="text" class="numbers format-input" ' + (data.d[t].TypeName == '1' || data.d[t].TypeName == '2' ? "disabled" : "") + ' id="quantity' + data.d[t].MaterialId + '" value="' + data.d[t].Norm + '" /></td>';
                        //html += '<td><input type="text" class="format-input" ' + (data.d[t].TypeName == '1' || data.d[t].TypeName == '2' ? "disabled" : "") + ' id="unit' + data.d[t].MaterialId + '" value="' + data.d[t].UnitName + '" /></td>';
                        html += '</tr>';
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
            $('#txtColor').val('');
            $('#txtDescription').val('');
            $('#removeDept').hide();
            $("#data-detail-soi tr").remove();
            $('#saveDept').show();
            document.getElementById('lb').innerText = 'THÊM MẪU THIẾT KẾ';
        }
        function saveChanges() {
            var data = "";
            $("#data-detail-soi tr").each(function () {
                var id = $(this).attr("data-id");
                var type = $(this).attr("data-type");
                //var q = $('#quantity' + id).val();
                //var unit = $('#unit' + id).val();

                if (data != "") data += "#";
                data += id + ',' + type;
            });
            
            var id = $('#hdDeptId').val();
            if (id == '') {
                var code = $('#txtCode').val();
                var name = $('#txtName').val();
                var month = $('#txtMonth').val();
                var des = $('#txtDescription').val();
                var color = $('#txtColor').val();
                var pro_type = $('#dlProductType').val();

                
                if (code == '') showAlert('Nhập mã thiết kế');
                else if (name == '') showAlert('Nhập tên mẫu');
                else if (pro_type == '') showAlert('Chọn loại mẫu');
                else if (data == '') showAlert('Chưa có dữ liệu nào');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertForm',
                        data: '{"code":"' + code + '","name":"' + name + '","month":"'+month+'","color":"'+color+'","des":"'+des+'","normid":"'+pro_type+'","data":"'+data+'"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã thêm mẫu [' + name + ']');
                                
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
            return false;
        }
        function updateChanges() {
            if (confirm("Bạn chắc chắn muốn cập nhật mẫu " + $('#txtName').val() + " ?") == true) {
                var id = $('#hdDeptId').val();
                var code = $('#txtCode').val();
                var name = $('#txtName').val();
                var month = $('#txtMonth').val();
                var des = $('#txtDescription').val();
                var color = $('#txtColor').val();
                var pro_type = $('#dlProductType').val();

                var data = "";
                $("#data-detail-soi tr").each(function () {
                    var id = $(this).attr("data-id");
                    var type = $(this).attr("data-type");
                    //var q = $('#quantity' + id).val();
                    //var unit = $('#unit' + id).val();

                    if (data != "") data += "#";
                    data += id + ',' + type;
                });

                if (code == '') showAlert('Nhập mã thiết kế');
                else if (name == '') showAlert('Nhập tên mẫu');
                else if (pro_type == '') showAlert('Chọn loại mẫu');
                else if (data == '') showAlert('Chưa có dữ liệu nào');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateForm',
                        data: '{"id":"' + id + '","code":"' + code + '","name":"' + name + '","month":"' + month + '","color":"'+color+'","des":"' + des + '","normid":"' + pro_type + '","data":"' + data + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã cập nhật mẫu [' + name + ']');
                               
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
        }
        function deleteDept() {
            //var fileInputCSV = document.getElementById('fileForm');
            //var file = fileInputCSV.files[0];
            //console.log(file);

            //if (!file || !file.type.match(/image.*/)) return;
            //var fd = new FormData();
            //fd.append("file", file);

            //$.ajax({
            //    type: 'POST',
            //    url: '/Command.aspx/getNormByType',
            //    data: '{"productTypeId":"' + pro_type + '","type":"' + type_id + '"}',
            //    contentType: 'application/json; charset=utf-8',
            //    dataType: 'json',
            //    success: function (data) {
            //        quan = data.d;
            //        var html = "";
            //        html += '<tr data-id="' + id + '" data-type="' + type_id + '" id="rows' + id + '"><td><a onclick="removeproduct(' + id + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td><td>' + name + '</td><td>' + type_name + '</td><td><input type="text" class="numbers format-input" disabled id="quantity' + id + '" value="' + quan + '" /></td></tr>';
            //        $('#data-detail-soi').append(html);
            //        $('#txtQuantity').val('');
            //    }
            //});

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
            //var quan = $('#txtQuantity').val();
            //var unit = $('#txtUnit').val();
            var pro_type = $('#dlProductType').val();
            var ok = true;

            if (id == '') showAlert('Chọn nguyên phụ liệu');
            else if (type_id == 0)
                showAlert('Chọn loại nguyên phụ liệu');
            else if ((type_id == 1 || type_id == 2) && pro_type == '')
                showAlert('Chọn loại mẫu');
            //else if (type_id != 1 && type_id!=2 && quan == '')
            //    showAlert('Nhập định mức');
            else {
                $("#data-detail-soi tr").each(function () {
                    var _id = $(this).attr("data-id");
                    if (_id == id) ok = false;
                });

                if (ok) {
                    var html = "";
                    html += '<tr data-id="' + id + '" data-type="' + type_id + '" id="rows' + id + '"><td><a onclick="removeproduct(' + id + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td><td>' + name + '</td><td>' + type_name + '</td></tr>';
                    $('#data-detail-soi').append(html);
                    //$('#txtQuantity').val('');
                    //$('#txtUnit').val('');
                }
                else
                    showAlert('Đã tồn tại nguyên phụ liệu ' + name);
            }
        }
        function removeproduct(index) {
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                var id = '#rows' + index;
                $(id).remove();
                showAlert('Đã xóa nguyên phụ liệu ');
            }
            return false;
        }
        function changeType() {
            //var t = $('#dlType').val();
            //if (t == 1 || t == 2) {
            //    $("#txtQuantity").prop('disabled', true);
            //    $('#txtQuantity').val('');
            //}
            //else {
            //    $("#txtQuantity").prop('disabled', false);
            //    $('#txtQuantity').val('');
            //    $('#txtQuantity').focus();
            //}
        }
        function changeProductType() {
            $("#data-detail-soi tr").remove();
        }
        function uploadImage(fileURL) {
            var win = function (r) {
                alert("Code = " + r.responseCode);
                alert("Response = " + r.response);
                alert("Sent = " + r.bytesSent);
            };

            var fail = function (error) {
                alert("An error has occurred: Code = " + error.code);
                alert("upload error source " + error.source);
                alert("upload error target " + error.target);
            };

            var options = new FileUploadOptions();
            options.fileKey = "File";
            options.fileName = fileURL.substr(fileURL.lastIndexOf('/') + 1);
            options.mimeType = "image/jpeg";

            var params = {};
            params.action = "save";
            params.name = fileURL.substr(fileURL.lastIndexOf('/') + 1);;
            options.params = params;

            var ft = new FileTransfer();
            ft.upload(fileURL, encodeURI("/Command.aspx/saveImageForm"), win, fail, options);
            
        }
        function getFileToUpload(){
            var fileURL = (getWebPath() + "/images/Strabburg.jpg");
            uploadImage(fileURL);
            return false;
        }
        function getWebPath() {
            var path = window.location.pathname ;
            path = path.substring( 0, path.lastIndexOf('/') ) ;
            return 'file://' + path ;
        }
        function sendimg() {
            var fileInputCSV = document.getElementById('fileForm');
            var file = fileInputCSV.files[0];
            
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                }
               
            };
            xhttp.open("POST", "/Command.aspx/PostUserImage?files=" + file, true);
            xhttp.send();

            //$.ajax({
            //    type: 'POST',
            //    url: '/Command.aspx/PostUserImage',
            //    data: '{"files":"' + file + '"}',
            //    contentType: 'application/json; charset=utf-8',
            //    dataType: 'json',
            //    success: function (data) {
            //        console.log(data.d);
            //    }
            //});
        }
    </script>
</asp:Content>

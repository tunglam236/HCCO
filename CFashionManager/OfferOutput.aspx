﻿<%@ Page Title="Xuất nguyên phụ liệu" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="OfferOutput.aspx.cs" Inherits="OfferOutput" %>

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
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-sign-out"></i> Xuất nguyên phụ liệu</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addDept();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDept"><i class="glyphicon glyphicon glyphicon-edit"></i> Tạo phiếu xuất mới</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Chi nhánh</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Số phiếu xuất</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
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
                        <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày xuất</th>
                        <th class="bg-th">Người xuất</th>
                        <th class="bg-th">Số phiếu xuất</th>
                        <th class="bg-th">Thiết kế</th>
                        <th class="bg-th">Mẫu</th>
                        <th class="bg-th">Ghi chú</th>
                        
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                      <th class='bg-th center' width="40px">STT</th>
                       <th class="bg-th">Chi nhánh</th>
                        <th class="bg-th">Ngày xuất</th>
                        <th class="bg-th">Người xuất</th>
                        <th class="bg-th">Số phiếu xuất</th>
                        <th class="bg-th">Thiết kế</th>
                        <th class="bg-th">Mẫu</th>
                        <th class="bg-th">Ghi chú</th>
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
                        <span id="lb">XUẤT NGUYÊN PHỤ LIỆU THEO MẪU</span>
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
                         <div class="col-md-6">Chọn mẫu thiết kế<br /> 
                                 <select id="dlForm" class="form-control select2" onchange="selectForm($(this).val())" style="width: 100%;">
                                 </select>
                             </div>
                        <div class="col-md-6">
                            Nội dung xuất<br />
                            <input type="text" id="txtDescription" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                     <div class="row" style="padding: 5px; max-height:250px; overflow-y:auto;max-width:100%; overflow-x:auto;">
                         <table id="tbdetail-soi" cellpadding="5" cellspacing="5" border="0" width="98%" style="min-width: 550px; margin-left: 15px;">
                            <thead>
                                <tr>
                                    <th style="width:30px">Xóa</th>
                                    <th>Nguyên phụ liệu</th>
                                    <th>Số lượng xuất</th>
                                    <th>Đơn vị tính</th>
                                    <th>Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody id="data-detail-soi">
                            </tbody>
                        </table>
                        </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                             <button type="button" id="saveDept" class="btn btn-primary" onclick="saveChanges();">
                                Lưu phiếu xuất</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng lại</button>
                            &nbsp;<label> <input type="checkbox" id="ckAutoLoad" checked="checked" /> Tải lại trang</label>
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
                }
            });
        });
    </script>
    <script type="text/javascript">
        function update_modal(id, branchtype, branch,formid, note, status) {
            $("#addDept").modal({ show: false });
            $('#saveDept').hide();
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

            $('#dlForm').find('option').remove().end();
            var cForm = document.getElementById('dlForm');
            var opt_form = document.createElement('option');
            opt_form.value = '';
            opt_form.innerHTML = 'Chọn mẫu thiết kế';
            cForm.appendChild(opt_form);

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
                url: '/Command.aspx/loadFormByBranchType',
                data: '{"branchtype":"' + branchtype + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._content;
                        opt.innerHTML = data.d[i]._mess;
                        cForm.appendChild(opt);
                    }
                    $('#dlForm').val(formid);
                    $('#select2-dlForm-container').text($('#dlForm option:selected').text());
                }
            });

            document.getElementById('lb').innerText = 'CẬP NHẬT PHIẾU ĐỀ XUẤT';
            $("#data-detail-soi tr").remove();

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadNormByFormId',
                data: '{"idForm":"' + formid + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var html = '';
                    for (var i = 0; i < data.d.length; i++) {
                        html = '';
                        html += '<tr data-by="' + data.d[i].CreateBy + '" data-code="' + data.d[i].FormCode + '" data-name="' + data.d[i].FormName + '" data-id="' + data.d[i].MaterialId + '" id="rows' + data.d[i].MaterialId + '">';
                        html += '<td><a onclick="removeproduct(' + data.d[i].MaterialId + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                        html += '<td>' + data.d[i].MaterialName + '</td>';
                        html += '<td>' + data.d[i].NormValue + '</td>';
                        html += '<td>' + data.d[i].Unit + '</td>';
                        html += '<td>' + data.d[i].Note + '</td>';
                        html += '</tr>';
                        $('#data-detail-soi').append(html);
                    }
                }
            });
        }
        function addDept() {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val('');
            $('#txtDescription').val('');

            $('#saveDept').show();
            $("#data-detail-soi tr").remove();
            
            document.getElementById('lb').innerText = 'XUẤT NGUYÊN PHỤ LIỆU THEO MẪU';
        }
        function saveChanges() {
            var des = $('#txtDescription').val();
            var branchTypeId = $('#dlBranchType').val();
            var branchId = $('#dlBranch').val();
            var formId = $('#dlForm').val();

            var checkbox = $('#ckAutoLoad:checked').val();
            var ckload = checkbox == 'on' ? true : false;
            
            if (branchTypeId == '') showAlert('Chọn chuỗi');
            else if (branchId == '') showAlert('Chọn chi nhánh');
            else if (formId == '') showAlert('Chọn mẫu thiết kế');
            else if (des == '') showAlert('Nhập nội dung phiếu xuất');
            else {
                var data = "";
                $("#data-detail-soi tr").each(function () {
                    var id = $(this).attr("data-id");
                    var create = $(this).attr("data-by");
                    var fCode = $(this).attr("data-code");
                    var fName = $(this).attr("data-name");
                    var quantity = $('#quantity' + id).val();
                    var unit = $('#unit' + id).val();
                    var note = $('#note' + id).val();
                    if (data != '') data += '#';
                    data += id + '|' + create + '|' + fCode + '|' + fName + '|' + quantity + '|' + unit + '|' + note
                });
                if (data != '') {
                    
                    var id = $('#hdDeptId').val();
                    
                    if (id == '') {
                        $.ajax({
                            type: 'POST',
                            url: '/Command.aspx/insertOfferOutputMaterial',
                            data: '{"branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","formId":"' + formId + '","note":"' + des + '","data":"' + data + '"}',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (data) {
                                if (data.d._content == '1') {
                                    showAlert('Đã lưu phiếu xuất nguyên phụ liệu');
                                    if (ckload) {
                                        setTimeout(function () {
                                            window.location.href = window.location.href;
                                        }, 1000);
                                    }
                                    else {
                                        $('#txtDescription').val('');
                                        $("#data-detail-soi tr").remove();
                                        $("#addDept").modal('hide');
                                    }
                                }
                                else
                                    showAlert(data.d._mess);
                            }
                        });
                    }
                    else {
                        //updateChanges();
                    }
                }
                else
                    showAlert('Chưa có dữ liệu nào để lưu');
            }
            return false;
        }
        function updateChanges() {
            if (confirm("Bạn chắc chắn muốn cập nhật phiếu đề xuất ?") == true) {
                var id = $('#hdDeptId').val();
                var des = $('#txtDescription').val();
                var branchTypeId = $('#dlBranchType').val();
                var branchId = $('#dlBranch').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                if (branchTypeId == '') showAlert('Chọn chuỗi');
                else if (branchId == '') showAlert('Chọn chi nhánh');
                else if (des == '') showAlert('Nhập nội dung đề xuất');
                else {
                    var data = "";
                    $("#data-detail-soi tr").each(function () {
                        var id = $(this).attr("data-id");
                        var quantity = $('#quantity' + id).val();
                        var unit = $('#unit' + id).val();
                        var note = $('#note' + id).val();
                        if (data != '') data += '#';
                        data += id + '|' + quantity + '|' + unit + '|' + note
                    });
                    if (data != '') {
                        var id = $('#hdDeptId').val();

                        if (id == '') {
                            $.ajax({
                                type: 'POST',
                                url: '/Command.aspx/updateOfferMaterial',
                                data: '{"Id":"'+id+'","branchTypeId":"' + branchTypeId + '","branchId":"' + branchId + '","note":"' + des + '","data":"' + data + '"}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (data) {
                                    if (data.d._content == '1') {
                                        showAlert('Đã cập nhật phiếu đề xuất');
                                        if (ckload) {
                                            setTimeout(function () {
                                                window.location.href = window.location.href;
                                            }, 1000);
                                        }
                                        else {
                                            $('#txtDescription').val('');
                                            $("#data-detail-soi tr").remove();
                                            $("#addDept").modal('hide');
                                        }
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
                    showAlert('Chưa thực hiện');
                    //$.ajax({
                    //    type: 'POST',
                    //    url: '/Command.aspx/deleteOfferMaterial',
                    //    data: '{"Id":"' + id + '"}',
                    //    contentType: 'application/json; charset=utf-8',
                    //    dataType: 'json',
                    //    success: function (data) {
                    //        if (data.d._content == '1') {
                    //            $('#hdDeptId').val('');
                    //            $('#delete' + id).remove();
                    //            showAlert('Đã xóa phiếu đề xuất');
                    //            $("#addDept").modal('hide');
                    //        }
                    //        else
                    //            showAlert(data.d._mess);
                    //    }
                    //});
                }
                else showAlert('Chọn phiếu đề xuất muốn xóa');
            }
        }
    </script>
    <script>
        function changeType(id) {
            $('.process-loading').show();
            $('#data-detail tr').remove();
            loadBranchbyType(id);
            $('.process-loading').hide();
        }
        function loadBranchbyType(id) {
            $('#dlBranch').find('option').remove().end();
            var c1 = document.getElementById('dlBranch');
            var opt_ = document.createElement('option');
            opt_.value = '';
            opt_.innerHTML = 'Chọn chi nhánh';
            c1.appendChild(opt_);

            $('#dlForm').find('option').remove().end();
            var cForm = document.getElementById('dlForm');
            var opt_form = document.createElement('option');
            opt_form.value = '';
            opt_form.innerHTML = 'Chọn mẫu thiết kế';
            cForm.appendChild(opt_form);

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
                    url: '/Command.aspx/loadFormByBranchType',
                    data: '{"branchtype":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i]._content;
                            opt.innerHTML = data.d[i]._mess;
                            cForm.appendChild(opt);
                        }
                    }
                });
            }
        }
        function selectForm() {
            var id = $('#dlForm').val();
            $("#data-detail-soi tr").remove();
            if (id != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/loadNormByFormId',
                    data: '{"idForm":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var html = '';
                        for (var i = 0; i < data.d.length; i++) {
                            html = '';
                            html += '<tr data-by="' + data.d[i].CreateBy + '" data-code="' + data.d[i].FormCode + '" data-name="' + data.d[i].FormName + '" data-id="' + data.d[i].MaterialId + '" id="rows' + data.d[i].MaterialId + '">';
                            html += '<td><a onclick="removeproduct(' + data.d[i].MaterialId + ');"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>';
                            html += '<td>' + data.d[i].MaterialName + '</td>';
                            html += '<td><input type="text" disabled class="numbers format-input" id="quantity' + data.d[i].MaterialId + '" value="' + data.d[i].NormValue + '" /></td>';
                            html += '<td><input type="text" disabled class="numbers format-input" id="unit' + data.d[i].MaterialId + '" value="' + data.d[i].Unit + '" /></td>';
                            html += '<td><input type="text" class="format-input-text" id="note' + data.d[i].MaterialId + '" value="' + data.d[i].Note + '" /></td>';
                            html += '</tr>';
                            $('#data-detail-soi').append(html);
                        }
                    }
                });
            }
        }
    </script>
</asp:Content>


<%@ Page Title="Quản lý định mức vải" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Norm.aspx.cs" Inherits="Norm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="dist/css/client.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
       <div class="col-xs-12 col-md-12">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-star"></i> Quản lý định mức vải</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addNorm();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDept"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm định mức</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhóm mẫu</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Vải chính</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Vải lót</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Vải phối</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ghi chú</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:600px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Nhóm mẫu</th>
                        <th class="bg-th">Vải chỉnh(m)</th>
                        <th class="bg-th">Vải lót(m)</th>
                         <th class="bg-th">Ghi chú</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Nhóm mẫu</th>
                       <th class="bg-th">Vải chỉnh(m)</th>
                        <th class="bg-th">Vải lót(m)</th>
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
                        <span id="lb">THÊM ĐỊNH MỨC</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Chọn nhóm mẫu<br />
                             <select id="dlProductType" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                         <div class="col-md-4">Định mức vải chính(m)<br />
                            <input type="text" id="txtClothPrimary" class="numbers form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Định mức vải lót(m)<br />
                             <input type="text" id="txtClothSub" class="numbers form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                            Ghi chú<br />
                            <input type="text" id="txtDescription" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                             <span class=" btn-group">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="removeDept" style="display:none;" class="btn btn-success" onclick="deleteNorm();">
                                Xóa</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Hủy bỏ</button></span>
                            &nbsp;<label> <input type="checkbox" id="ckAutoLoad" checked="checked" /> Auto load</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdDeptId" value="" />
    <script>
        var options = ["1", "2", "3","4","5"];

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
             $('#dlProductType').find('option').remove().end();
             var c2 = document.getElementById('dlProductType');
             var op = document.createElement('option');
             op.value = '';
             op.innerHTML = 'Chọn nhóm mẫu';
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
        });
    </script>
    <script type="text/javascript">
        function update_modal(id,type, primary, sub, des) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#dlProductType').val(type);
            $('#select2-dlProductType-container').text($('#dlProductType option:selected').text());

            $('#txtClothPrimary').val(primary);
            $('#txtClothSub').val(sub);
            $('#txtDescription').val(des);
            $('#removeDept').show();
            document.getElementById('lb').innerText = 'CẬP NHẬT MẪU THIẾT KẾ';
        }
        function addNorm() {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val('');
            $('#txtClothPrimary').val('');
            $('#txtClothSub').val('');
            $('#txtDescription').val('');

            $('#removeDept').hide();
            document.getElementById('lb').innerText = 'THÊM MẪU THIẾT KẾ';
        }
        function saveChanges() {
            var id = $('#hdDeptId').val();
            if (id == '') {
                var primary = $('#txtClothPrimary').val();
                var sub = $('#txtClothSub').val();
                var type = $('#dlProductType').val();
                var des = $('#txtDescription').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                if (type == '') showAlert('Chọn nhóm mẫu');
                else if (primary == '')
                    showAlert('Nhập định mức vải chính');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertNorm',
                        data: '{"productTypeId":"'+type+'","clothPrimary":"' + primary + '","clothSub":"' + sub + '","des":"' + des + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã thêm định mức');
                                if (ckload) {
                                    setTimeout(function () {
                                        window.location.href = window.location.href;
                                    }, 1000);
                                }
                                else {
                                    $('#txtClothPrimary').val('');
                                    $('#txtClothSub').val('');
                                    $('#txtDescription').val('');
                                    $('#txtClothPrimary').focus();

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
            else {
                updateChanges();
            }
        }
        function updateChanges() {
            var primary = $('#txtClothPrimary').val();
            var sub = $('#txtClothSub').val();
            var des = $('#txtDescription').val();
            var type = $('#dlProductType').val();
            var id = $('#hdDeptId').val();

            var checkbox = $('#ckAutoLoad:checked').val();
            var ckload = checkbox == 'on' ? true : false;

            if (type == '') showAlert('Chọn nhóm mẫu');
            else if (primary == '')
                showAlert('Nhập định mức vải chính');
            else
            {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateNorm',
                    data: '{"id":"' + id + '","productTypeId":"' + type + '","clothPrimary":"' + primary + '","clothSub":"' + sub + '","des":"' + des + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {

                            showAlert('Đã cập nhật định mức');
                            
                            if (ckload) {
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else {
                                $('#txtClothPrimary').val('');
                                $('#txtClothSub').val('');
                                $('#txtDescription').val('');
                                $('#txtClothPrimary').focus();

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
        function deleteNorm() {
            var id = $('#hdDeptId').val();
            var name = $('#txtName').val();
            if (confirm("Bạn chắc chắn muốn xóa ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteNorm',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdDeptId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa định mức');
                                $("#addDept").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn định mức muốn xóa');
            }
        }
    </script>
</asp:Content>


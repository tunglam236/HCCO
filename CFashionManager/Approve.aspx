<%@ Page Title="Cấu hình phê duyệt" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Approve.aspx.cs" Inherits="Approve" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="dist/css/client.css" rel="stylesheet" />
<style type="text/css">
    table#example2 tbody tr {
        cursor:pointer;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
       <div class="col-xs-12 col-md-12">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-gavel"></i> Cấu hình phê duyệt Module</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addDept();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDept"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm Module</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Code</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Module</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhóm duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Người duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Cấp duyệt</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="7" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên duyệt</label> </a></li>
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
                        <th class="bg-th">Code</th>
                         <th class="bg-th">Module</th>
                         <th class="bg-th">Nhóm duyệt</th>
                         <th class="bg-th">Người duyệt</th>
                         <th class="bg-th">Cấp duyệt</th>
                         <th></th>
                         <th class="bg-th">Tên duyệt</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                       <th class='bg-th center' width="40px">STT</th>
                         <th class="bg-th">Code</th>
                          <th class="bg-th">Module</th>
                        <th class="bg-th">Nhóm duyệt</th>
                         <th class="bg-th">Người duyệt</th>
                          <th class="bg-th">Cấp duyệt</th>
                         <th></th>
                         <th class="bg-th">Tên duyệt</th>
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
                        <span id="lb">THÊM MODULE</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Mã module<br />
                            <input type="text" id="txtCode" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Tên module<br />
                            <input type="text" id="txtName" class="form-control" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">Cấp duyệt<br />
                             <input type="text" id="txtLevel" class="numbers form-control" style="width: 100%;" />
                        </div>
                         
                    </div>
                     <div class="row" style="padding: 5px;">
                        <div class="col-md-4">Nhóm duyệt<br />
                            <select id="dlGroup" class="form-control select2" onchange="changeGroup($(this).val())" style="width: 100%;">
                            </select>
                        </div>
                         <div class="col-md-4">Người duyệt<br />
                            <select id="dlUser" class="form-control select2" style="width: 100%;">
                            </select>
                        </div>
                          <div class="col-md-4">Tên duyệt<br />
                             <input type="text" id="txtLevelName" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12">
                             <span class=" btn-group">
                            <button type="button" id="saveDept" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="removeDept" style="display:none;" class="btn btn-success" onclick="deleteDept();">
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
        var options = ["1","2","3","4","5","6","7","8"];
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
                   "targets": [],
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

            $('#example2 tbody').on('click', 'tr', function () {
                $(this).toggleClass('selected');
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
             $('#dlUser').find('option').remove().end();
             var c2 = document.getElementById('dlUser');
             var op = document.createElement('option');
             op.value = '';
             op.innerHTML = 'Chọn người duyệt';
             c2.appendChild(op);

             $('#dlGroup').find('option').remove().end();
             var c3 = document.getElementById('dlGroup');
             op = document.createElement('option');
             op.value = '';
             op.innerHTML = 'Chọn nhóm duyệt';
             c3.appendChild(op);

             $.ajax({
                 type: 'POST',
                 url: '/Command.aspx/getGroupUser',
                 //data: '{"branchType":"2"}',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     for (var i = 0; i < data.d.length; i++) {
                         var opt = document.createElement('option');
                         opt.value = data.d[i]._id;
                         opt.innerHTML = data.d[i]._mess + " | " + data.d[i]._content;
                         c3.appendChild(opt);
                     }
                 }
             });

            var group = $('#dlGroup').val();

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadUserByBranchType',
                data: '{"branchType":"2","group":"' + group + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._id;
                        opt.innerHTML = data.d[i]._content;
                        c2.appendChild(opt);
                    }
                }
            });

           
        });
    </script>
    <script type="text/javascript">
        function update_modal(id, code,name,group, user,level, levelname) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#txtCode').val(code);
            $('#txtName').val(name);
            $('#txtLevel').val(level);
            $('#txtLevelName').val(levelname);

            $('#dlGroup').val(group);
            $('#select2-dlGroup-container').text($('#dlGroup option:selected').text());

            $('#dlUser').find('option').remove().end();
            var c2 = document.getElementById('dlUser');
            var op = document.createElement('option');
            op.value = '';
            op.innerHTML = 'Chọn người duyệt';
            c2.appendChild(op);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadUserByBranchType',
                data: '{"branchType":"2","group":"' + group + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._id;
                        opt.innerHTML = data.d[i]._content;
                        c2.appendChild(opt);
                    }
                    $('#dlUser').val(user);
                    $('#select2-dlUser-container').text($('#dlUser option:selected').text());

                }
            });

            $('#removeDept').show();
            $('#saveDept').show();

            document.getElementById('lb').innerText = 'CẬP NHẬT MODULE';

        }
        function addLevel(code, name) {
            $("#addDept").modal({ show: false });
            $('#txtCode').val(code);
            $('#txtName').val(name);
            $('#txtLevel').val('');
            $('#txtLevelName').val('');
            $('#txtLevel').focus();
            $('#hdDeptId').val('');
            $('#removeDept').hide();
            $('#saveDept').show();

            document.getElementById('lb').innerText = 'THÊM CẤP DUYỆT';
        }
        function addDept() {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val('');
            $('#txtCode').val('');
            $('#txtName').val('');
            $('#txtLevel').val('');
            $('#txtLevelName').val('');

            $('#saveDept').show();
            $('#removeDept').hide();
            document.getElementById('lb').innerText = 'THÊM MODULE';
        }
        function saveChanges() {
            var id = $('#hdDeptId').val();
            if (id == '') {
                var code = $('#txtCode').val();
                var name = $('#txtName').val();
                var level = $('#txtLevel').val();
                var levelname = $('#txtLevelName').val();
                var user = $('#dlUser').val();
                var group = $('#dlGroup').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                if (code == '' || name=='') showAlert('Nhập mã và tên module');
                else if (level == '') showAlert('Nhập cấp duyệt');
                else if (user == '' && group=='') showAlert('Chọn nhóm hoặc người duyệt');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertApprove',
                        data: '{"code":"' + code + '","name":"' + name + '","group":"' + group + '","user":"' + user + '","level":"' + level + '","levelname":"' + levelname + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã thêm module [' + name + ']');
                                if (ckload) {
                                    setTimeout(function () {
                                        window.location.href = window.location.href;
                                    }, 1000);
                                }
                                else {
                                    $('#txtCode').val('');
                                    $('#txtName').val('');
                                    $('#txtLevel').val('');
                                    $('#txtLevelName').val('');
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
            else {
                updateChanges();
            }
        }
        function updateChanges() {
            if (confirm("Bạn chắc chắn muốn cập nhật module " + $('#txtName').val() + " ?") == true) {
                var id = $('#hdDeptId').val();
                var code = $('#txtCode').val();
                var name = $('#txtName').val();
                var level = $('#txtLevel').val();
                var levelname = $('#txtLevelName').val();
                var user = $('#dlUser').val();
                var group = $('#dlGroup').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                if (code == '' || name=='') showAlert('Nhập mã và tên module');
                else if (level == '') showAlert('Nhập cấp duyệt');
                else if (user == '' && group=='') showAlert('Chọn nhóm hoặc người duyệt');
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/updateApprove',
                        data: '{"id":"' + id + '","code":"' + code + '","name":"' + name + '","group":"' + group + '","user":"' + user + '","level":"' + level + '","levelname":"' + levelname + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã cập nhật module [' + name + ']');
                                if (ckload) {
                                    setTimeout(function () {
                                        window.location.href = window.location.href;
                                    }, 1000);
                                }
                                else {
                                    $('#txtCode').val('');
                                    $('#txtName').val('');
                                    $('#txtLevel').val('');
                                    $('#txtLevelName').val('');
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
            var code = $('#txtCode').val();
            var name = $('#txtName').val();
            if (confirm("Bạn chắc chắn muốn xóa module [" + name + "] ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteApprove',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdDeptId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa module [' + code + ']');
                                $("#addDept").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn module muốn xóa');
            }
        }
        function changeGroup(idGroup) {
            $('#dlUser').find('option').remove().end();
            var c2 = document.getElementById('dlUser');
            var op = document.createElement('option');
            op.value = '';
            op.innerHTML = 'Chọn người duyệt';
            c2.appendChild(op);

            $.ajax({
                type: 'POST',
                url: '/Command.aspx/loadUserByBranchType',
                data: '{"branchType":"2","group":"' + idGroup + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i]._id;
                        opt.innerHTML = data.d[i]._content;
                        c2.appendChild(opt);
                    }
                }
            });
        }
    </script>
</asp:Content>


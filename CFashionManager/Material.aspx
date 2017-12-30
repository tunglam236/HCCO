<%@ Page Title="Quản lý nguyên, phụ liệu" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Material.aspx.cs" Inherits="Material" %>
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
        .detail-rows:hover,#tbdetail tr:hover {background-color: whitesmoke !important;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" Runat="Server">
    <section class="content">
   <div class="row">
       <div class="col-xs-12 col-md-12">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-star"></i> Quản lý nguyên, phụ liệu</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
    <a href="#" onclick="addDept();" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addDept"><i class="glyphicon glyphicon glyphicon-edit"></i> Thêm nguyên phụ liệu</a>
      <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mã NPL</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Tên NPL</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mô tả</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
            <div class="box-body" style="max-width:100%; overflow-x:auto;">
                <table id="example2" class="table hover cell-border" style="min-width:650px; font-size:12px;">
                  <thead>
                     <tr>
                        <th class='bg-th center' width="40px">STT</th>
                        <th class="bg-th">Mã nguyên phụ liệu</th>
                        <th class="bg-th">Tên nguyên phụ liệu</th>
                        <th class="bg-th">Mô tả</th>
                     </tr>
                  </thead>
                  <tbody id="rbody">
                  <asp:Literal ID="lbData" runat="server"></asp:Literal>
                  </tbody>
                  <tfoot>
                     <tr>
                         <th class='bg-th center' width="40px">STT</th>
                         <th class="bg-th">Mã nguyên phụ liệu</th>
                         <th class="bg-th">Tên nguyên phụ liệu</th>
                         <th class="bg-th">Mô tả</th>
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
                        <i class="fa fa-calculator" aria-hidden="true"></i>
                        <span id="lb">THÊM NGUYÊN PHỤ LIỆU</span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Mã nguyên phụ liệu<br />
                            <input type="text" id="txtCode" class="form-control" style="width: 100%;" />
                        </div>
                         <div class="col-md-4">Tên nguyên phụ liệu<br />
                            <input type="text" id="txtName" class="form-control" style="width: 100%;" />
                        </div>
                          <div class="col-md-4">Mô tả<br />
                            <input type="text" id="txtDescription" class="form-control" style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 pull-right">
                             <span class=" btn-group">
                            <button type="button" class="btn btn-success" onclick="saveChanges();">
                                Lưu lại</button>
                            <button type="button" id="removeDept" style="display:none;" class="btn btn-success" onclick="deleteDept();">
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
        var options = ["1", "2", "3"];

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
        function update_modal(id, code, name, des) {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val(id);
            $('#txtCode').val(code);
            $('#txtName').val(name);
            $('#txtDescription').val(des);
            $('#removeDept').show();
            document.getElementById('lb').innerText = 'CẬP NHẬT NGUYÊN PHỤ LIỆU';
        }
        function addDept() {
            $("#addDept").modal({ show: false });
            $('#hdDeptId').val('');
            $('#txtCode').val('');
            $('#txtName').val('');
            $('#txtDescription').val('');
            $('#removeDept').hide();
            document.getElementById('lb').innerText = 'THÊM NGUYÊN PHỤ LIỆU';
        }
        function saveChanges() {
            var id = $('#hdDeptId').val();
            if (id == '') {
                var code = $('#txtCode').val();
                var name = $('#txtName').val();
                var des = $('#txtDescription').val();

                var checkbox = $('#ckAutoLoad:checked').val();
                var ckload = checkbox == 'on' ? true : false;

                if (code != '' && name != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/insertMaterial',
                        data: '{"branchtype":"2","code":"' + code + '","name":"' + name + '","des":"'+des+'"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã thêm nguyên phụ liệu [' + name + ']');
                                if (ckload) {
                                    setTimeout(function () {
                                        window.location.href = window.location.href;
                                    }, 1000);
                                }
                                else {
                                    $('#txtCode').val('');
                                    $('#txtName').val('');
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
                else showAlert('Nhập mã và tên nguyên phụ liệu');
            }
            else {
                updateChanges();
            }
        }
        function updateChanges() {
            var code = $('#txtCode').val();
            var name = $('#txtName').val();
            var des = $('#txtDescription').val();
            var id = $('#hdDeptId').val();

            var checkbox = $('#ckAutoLoad:checked').val();
            var ckload = checkbox == 'on' ? true : false;

            if (code != '' && name != '') {
                $.ajax({
                    type: 'POST',
                    url: '/Command.aspx/updateMaterial',
                    data: '{"id":"' + id + '","branchtype":"2","code":"' + code + '","name":"' + name + '","des":"' + des + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == '1') {

                            showAlert('Đã cập nhật nguyên phụ liệu [' + name + ']');
                            
                            if (ckload) {
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 1000);
                            }
                            else {
                                $('#txtCode').val('');
                                $('#txtName').val('');
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
            else showAlert('Nhập mã và tên nguyên phụ liệu');
        }
        function deleteDept() {
            var id = $('#hdDeptId').val();
            var name = $('#txtName').val();
            if (confirm("Bạn chắc chắn muốn xóa [" + name + "] ?") == true) {
                if (id != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/Command.aspx/deleteMaterial',
                        data: '{"id":"' + id + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                $('#hdDeptId').val('');
                                $('#delete' + id).remove();
                                showAlert('Đã xóa nguyên phụ liệu [' + name + ']');
                                $("#addDept").modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
                else showAlert('Chọn nguyên phụ liệu muốn xóa');
            }
        }
    </script>
</asp:Content>


